{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -t --user-menu -r --asterisks --cmd start-hyprland";
	user = "greeter";
      };
    };
  };
}
