{ pkgs, ... }: {
  stylix.targets = {
    starship.enable = false;
    nixcord.enable = false;
  };

  stylix.cursor = {
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 23;
  };
}
