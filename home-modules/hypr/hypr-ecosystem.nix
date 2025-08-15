{ config, ... }:
let
  accentColor = config.lib.stylix.colors.withHashtag.base0D;
  baseColor = config.lib.stylix.colors.withHashtag.base00;
  textColor = config.lib.stylix.colors.withHashtag.base05;
  red = config.lib.stylix.colors.withHashtag.base08;
  yellow = config.lib.stylix.colors.withHashtag.base0A;
  surface0 = config.lib.stylix.colors.withHashtag.base02;
  font = "Hack Nerd Font Mono";
in
{
  services = {
    hyprpolkitagent.enable = true;

    # hypridle = {
    #   enable = true;

    #   settings = {
    #     general = {
    #       lock_cmd = "pidof hyprlock || hyprlock"; # avoid starting multiple hyprlock instances.
    #       before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
    #       after_sleep_cmd = "hyprctl dispatch dpms on"; # to avoid having to press a key twices to turn on the display.
    #     };

    #     listener = [
    #       {
    #         timeout = 150;
    #         on-timeout = "brightnessctl -s set 10";
    #         on-resume = "brightnessctl -r";
    #       }
    #       {
    #         timeout = 150;
    #         on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
    #         on-resume = "brightnessctl -rd rgb:kbd_backlight set 100%";
    #       }
    #       {
    #         timeout = 300;
    #         on-timeout = "loginctl lock-session";
    #       }
    #       {
    #         timeout = 330;
    #         on-timeout = "hyprctl dispatch dpms off";
    #         on-resume = "hyprctl dispatch dpms on";
    #       }
    #       {
    #         timeout = 1800;
    #         on-timeout = "systemctl suspend";
    #       }
    #     ];
    #   };
    # };
  };

  programs = {
    hyprlock = {
      enable = true;

      settings = {
        # GENERAL
        general.hide_cursor = true;

        # BACKGROUND
        background = {
          monitor = "";
          path = "~/nixos/home-modules/hypr/wallpaper.png";
          blur_passes = 0;
          color = baseColor;
        };

        label = [
          # TIME
          {
            monitor = "";
            text = "$TIME";
            color = textColor;
            font_size = 90;
            font_family = font;
            position = "-30, 0";
            halign = "right";
            valign = "top";
          }
          # DATE
          {
            monitor = "";
            text = "cmd[update:43200000] date +'%A, %d %B %Y'";
            color = textColor;
            font_size = 25;
            font_family = font;
            position = "-30, -150";
            halign = "right";
            valign = "top";
          }
        ];

        # INPUT FIELD
        input-field = {
          monitor = "";
          size = "300, 60";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = accentColor;
          inner_color = surface0;
          font_color = textColor;
          fade_on_empty = false;
          placeholder_text = "<span foreground='#${textColor}'><i>󰌾 Logged in as </i><span foreground='#${accentColor}'>$USER</span></span>";
          hide_input = false;
          check_color = accentColor;
          fail_color = red;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = yellow;
          position = "0, -47";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
