{ configs, pkgs, lib, ... }: {
  home.packages = [ pkgs.starship ];
  xdg.configFile."starship.toml".source = ./starship.toml;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
