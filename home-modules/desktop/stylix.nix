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
}
