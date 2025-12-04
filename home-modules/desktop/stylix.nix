{ pkgs, ... }:
{
  stylix.targets = {
    starship.enable = false;
    nixcord.enable = false;
    vscode.enable = false;
    hyprlock.enable = false;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
  };
}
