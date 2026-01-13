{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
      enableRenice = true;
    };
  };

  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    gamescope-wsi
  ];
}
