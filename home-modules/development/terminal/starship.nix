{ configs, pkgs, ... }: {
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
