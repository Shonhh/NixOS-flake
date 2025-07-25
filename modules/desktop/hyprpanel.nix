{ inputs, pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;
    package = inputs.hyprpanel.packages.${pkgs.system}.default;
  };

  programs.hyprpanel.settings = {
    bar = {
      layouts = {
        "*" = {
	   left = [ "dashboard" "workspaces" "media" ];
	   middle = [ "windowtitle" ];
	   right = [ "volume" "network" "clock" "notifications" ];
	 };
      };

      launcher.autoDetectIcon = true;
    };

    menus = {
      clock = {
        time.hideSeconds = true;
        weather.unit = "imperial";
      };
      dashboard = {
 	shortcuts.enabled = false;
	directories.enabled = false;
	stats.enabled = false;
      };
    };

    theme = {
      bar.outer_spacing = "8px";
      font = {
	name = "Hack Nerd Font Mono";
	label = "Hack Nerd Font Mono Bold";
	size = "0.9rem";
      };
    };
  };
}
