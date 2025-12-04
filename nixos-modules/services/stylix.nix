{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = ../../home-modules/hypr/wallpaper2.png;
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font";
      };

      sansSerif = {
        package = pkgs.lato;
        name = "Lato";
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;

      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    targets = {
      spicetify.enable = false;
      grub.enable = false;
      plymouth.enable = false;
    };
  };
}
