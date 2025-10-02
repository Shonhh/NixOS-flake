{ pkgs, ... }: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../../home-modules/hypr/wallpaper.jpg;

    targets = {
      spicetify.enable = false;
      grub.enable = false;
    };
  };
}
