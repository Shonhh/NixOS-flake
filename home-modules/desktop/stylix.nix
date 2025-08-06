{ pkgs, ... }: {
  stylix.targets = {
    starship.enable = false;
    nixcord.enable = false;
    spicetify.enable = false;
  };

  stylix.cursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 23;
  };
}
