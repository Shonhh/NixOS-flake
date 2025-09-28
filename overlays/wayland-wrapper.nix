self: super:
let
  lib = super.lib;

  # This is a helper function that takes a final, realized derivation (a package)
  # and applies Wayland flags.
  wrapDerivation = drv:
    super.stdenv.mkDerivation {
      # Inherit pname and version to be compatible with modules that need them.
      pname = drv.pname;
      version = drv.version;
      name = "${drv.name}-wayland";

      # Add `makeWrapper` for wrapping and `file` for robust script detection.
      nativeBuildInputs = [ super.makeWrapper super.file ];

      # The original package is our "source".
      src = drv;
      # We don't need to unpack it, just reference its path.
      dontUnpack = true;

      installPhase = ''
        runHook preInstall

        # The builder doesn't always create $out automatically when using `dontUnpack = true`,
        # so we create it manually to prevent the `cp` command from failing.
        mkdir -p $out

        # Create the output directory structure by *copying* the contents of the original package.
        cp -a ${drv}/. $out

        # IMPORTANT FIX: Make the *entire* output directory and its contents writable.
        # `cp -a` preserves read-only permissions from the Nix store, which prevents patching.
        chmod -R u+w $out

        # Now, apply Wayland flags to all executables in the bin directory.
        if [ -d "$out/bin" ]; then
          for bin_path in $out/bin/*; do
            # Skip anything that isn't a regular, executable file
            if ! [ -f "$bin_path" ] || [ -L "$bin_path" ] || ! [ -x "$bin_path" ]; then
              continue
            fi

            # UNIFIED APPROACH: Wrap both binaries and scripts.
            # This is the most robust method as it correctly chains wrappers.
            echo "Wrapping executable: $bin_path"
            mv "$bin_path" "$bin_path.real"
            makeWrapper "$bin_path.real" "$bin_path" \
              --add-flags "--enable-features=UseOzonePlatform" \
              --add-flags "--ozone-platform=wayland"
          done
        fi

        runHook postInstall
      '';

      # This phase fixes hardcoded store paths in scripts, which is crucial for
      # applications like Spotify that are patched by other modules (Spicetify).
      postFixup = ''
        # Find all files in the output directory that contain the old store path.
        # Use `grep -I` to ensure we only process text files, avoiding binary corruption.
        for f in $(find $out -type f -exec grep -I -l "${drv}" {} +); do
          substituteInPlace "$f" --replace "${drv}" "$out"
        done
      '';

      # Pass through meta attributes to provide desktop files, main program info, etc.
      meta = drv.meta // {
        mainProgram = drv.meta.mainProgram or drv.pname;
      };

      # Pass through any other attributes the original package might have.
      passthru = drv.passthru;
    };
in
{
  # This is the main function exported by the overlay.
  # It intelligently handles different kinds of packages.
  wrapWithWaylandFlags = pkg:
    let
      # Determine the base derivation.
      baseDrv = if lib.isFunction pkg then pkg {} else pkg;

      # Create the wrapped version of the base derivation.
      wrappedDrv = wrapDerivation baseDrv;
    in
      # If the original package had an `override` function, add it back.
      if pkg ? "override" then
        wrappedDrv // {
          # The new override function calls the *original* package's override,
          # and then recursively wraps the result.
          override = args: self.wrapWithWaylandFlags (pkg.override args);
        }
      else
        # If there was no override, just return the wrapped package.
        wrappedDrv;
}