{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t --user-menu -r --asterisks --cmd Hyprland";
	user = "greeter";
      };
    };
  };
}
