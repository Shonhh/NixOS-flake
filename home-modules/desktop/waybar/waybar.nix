{ configs, pkgs, lib, ... }: {
  # xdg.configFile."config.jsonc".source = ./config.jsonc
  # xdg.configFile."style.css".source = ./style.css

  programs.waybar = {
    enable = true;
  };
}
