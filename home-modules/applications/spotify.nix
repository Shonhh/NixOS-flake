{ pkgs, inputs, ... }: {
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${stdenv.system};
  in
    programs.spicetify = {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        shuffle
	# ... add more later
      ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
