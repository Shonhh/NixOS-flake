{ pkgs, lib, ... }:
{
  stylix.targets = {
    starship.enable = false;
    nixcord.enable = false;
    vscode.enable = false;
    hyprlock.enable = false;
    zed.enable = false;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = lib.mkDefault pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
  };
}
