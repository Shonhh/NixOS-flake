{ configs, pkgs, lib, ... }: {
  home.packages = [ pkgs.starship ];
  xdg.configFile."starship.toml".source = ./gruvbox-starship.toml;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
