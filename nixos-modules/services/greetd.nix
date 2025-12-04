{ pkgs, ... }:

let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    # `-l` activates layer-shell mode for gtkgreet.
    # `swaymsg exit` will run after gtkgreet finishes, closing the temporary Sway session.
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l; swaymsg exit"

    # Binds Super+Shift+e to a power menu in the greeter.
    bindsym Mod4+shift+e exec swaynag \
      -t warning \
      -m 'What do you want to do?' \
      -b 'Poweroff' 'systemctl poweroff' \
      -b 'Reboot' 'systemctl reboot'
  '';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
	user = "greeter";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    Hyprland
  '';
}
