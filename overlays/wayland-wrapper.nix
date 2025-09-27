self: super: {
  wrapWithWaylandFlags = pkg:
    super.symlinkJoin {
      name = "${pkg.name}-wayland";
      paths = [ pkg ];
      buildInputs = [ super.makeWrapper ];
      postBuild = ''
        mkdir -p $out/bin
        for bin in ${pkg}/bin/*; do
          if [ -f "$bin" ]; then
            makeWrapper "$bin" "$out/bin/$(basename "$bin")" \
              --add-flags "--enable-features=UseOzonePlatform" \
              --add-flags "--ozone-platform=wayland"
          fi
        done
      '';
    };
}