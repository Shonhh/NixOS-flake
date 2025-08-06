{ inputs, pkgs, ... }: {
  programs.hyprpanel = {
    package = inputs.hyprpanel.packages.${pkgs.system}.default;
    enable = true;
  };

  programs.hyprpanel.settings = {
    terminal = "ghostty";
    scalingPriority = "hyprland";
    wallpaper.enable = false;

    theme = {
      matugen = false;

      font = {
        size = "11px";
	name = "Hack Nerd Font";
	label = "Hack Nerd Font";
      };

      bar = {
        enableShadow = false;
	floating = false;
	outer_spacing = "8px";

	menus.monochrome = false;

	buttons = {
          borderSize = "0.1em";
	  enableBorders = false;
	  monochrome = false;
	  y_margins = "0.4em";

	  dashboard.enableBorder = false;
	};
      };
    };

    bar = {
      customModules.storage.paths = [
  	"/"
      ];

      launcher.autoDetectIcon = true;
      autoHide = "fullscreen";

      layouts = {
	"*" = {
	  "left" = [ "dashboard" "workspaces" "systray" "media" ];
	  "middle" = [ "windowtitle" ];
	  "right" = [ "volume" "network" "bluetooth" "battery" "clock" "notifications" ];
	};
      };

      workspaces = {
	show_numbered = false;
	show_icons = false;
	showWsIcons = false;
	showApplicationIcons = false;
	numbered_active_indicator = "underline";
	workspaceMask = false;
      };
    };

    menus = {
      clock = {
        time.hideSeconds = true;
	weather.location = "Austin";
      };

      dashboard = {
	powermenu.avatar.name = "Shonh";
	controls.enabled = false;
	stats.enabled = false;
	shortcuts.enabled = false;
	directories.enabled = false;
      };

      transition = "crossfade";
      transitionTime = 150;

      media.displayTime = false;
      media.displayTimeTooltip = true;

      power.showLabel = true;
    };
  };
}
