{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      environment.systemPackages = with pkgs; [
        mangohud
	protonup
      ];
    };
    gamemode.enable = true;
  };
}
