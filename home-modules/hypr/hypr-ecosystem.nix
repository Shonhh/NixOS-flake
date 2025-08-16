{ ... }:

{
  services = {
    hyprpolkitagent.enable = true;

    hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };

        listener = [
          {
            timeout = 270;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 270;
            on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
            on-resume = "brightnessctl -rd rgb:kbd_backlight";
          }
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 330;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };

  programs = {
    hyprlock = {
      enable = true;

      settings = {
        # GENERAL
        general = {
          hide_cursor = true;
          grace = 0;
          disable_loading_bar = true;
        };

        # BACKGROUND
        background = {
          monitor = "";
          path = "screenshot";
          blur_passes = 5;
          blur_size = 6;
          contrast = 0.8916;
          brightness = 0.6;
          vibrancy = 0.2;
          vibrancy_darkness = 0.0;
        };

        # INPUT FIELD
        input-field = {
          monitor = "";
          size = "200, 48";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.35;
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgba(242, 243, 244, 0.9)";
          fade_on_empty = false;
          rounding = -1;
          check_color = "rgb(250, 179, 135)";
          placeholder_text = "<i><span foreground='##cdd6f4'>Input Password...</span></i>";
          hide_input = false;
          position = "0, -60";
          halign = "center";
          valign = "center";
        };

        label = [
          # TIME
          {
            monitor = "";
            text = "cmd[update:1000] date '+ %-I:%M'";
            color = "rgba(242, 243, 244, 0.9)";
            font_size = 76;
            font_family = "JetBrains Mono Extrabold";
            position = "0, 60";
            halign = "center";
            valign = "center";
          }
          # DATE
          {
            monitor = "";
            text = "cmd[update:1000] date '+ %A, %B %d'";
            color = "rgba(242, 243, 244, 0.9)";
            font_size = 18;
            font_family = "JetBrains Mono";
            position = "0, 140";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };

    rofi = {
      enable = true;
    };
  };
}
