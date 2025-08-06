{ pkgs, inputs, ... }: {
  programs.spicetify = 
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      # ... add more later
    ];

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
