{ pkgs, config, ... }:

let
  # Hyprland session (from before)
  hyprland-session = pkgs.writeTextDir "share/wayland-sessions/hyprland.desktop" ''
    [Desktop Entry]
    Name=Hyprland
    Comment=Hyprland Session
    Exec=start-hyprland
    Type=Application
  '';

  # The new Steam Big Picture session
  steam-session = pkgs.writeTextDir "share/wayland-sessions/steam.desktop" ''
    [Desktop Entry]
    Name=Steam Big Picture Mode
    Comment=Start Steam in Big Picture Mode
    Exec=${pkgs.gamescope}/bin/gamescope -e -w 1920 -h 1080 -r 200 --xwayland-count 2 --hdr-enabled --hdr-itm-enabled -- ${pkgs.steam}/bin/steam -gamepadui
    Type=Application
  '';

  # This creates a folder containing both .desktop files
  session-files = pkgs.symlinkJoin {
    name = "greetd-sessions";
    paths = [
      hyprland-session
      steam-session
    ];
  };
in
{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # 4. Point to the joined directory
        command = "${pkgs.tuigreet}/bin/tuigreet -t --user-menu -r --remember-session --asterisks --sessions ${session-files}/share/wayland-sessions --cmd start-hyprland";
        user = "greeter";
      };
    };
  };
}
