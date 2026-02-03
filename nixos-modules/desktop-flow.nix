{
  lib,
  config,
  pkgs,
  ...
}:
let
  kde = config.my.desktop.kde;
  hypr = config.my.desktop.hyprland;
in
{
  options.my.desktop = {
    kde.enable = lib.mkEnableOption "KDE Plasma 6";
    hyprland.enable = lib.mkEnableOption "Hyprland System Support";
  };

  config = {
    # --- KDE LOGIC ---
    services.displayManager.sddm.enable = lib.mkIf kde.enable true;
    services.desktopManager.plasma6.enable = lib.mkIf kde.enable true;

    # If KDE is on, ensure SDDM uses Wayland
    services.displayManager.sddm.wayland.enable = lib.mkIf kde.enable true;

    environment.plasma6.excludePackages =
      with pkgs.kdePackages;
      lib.mkIf kde.enable [
        konsole
        # You can add others here too, e.g.:
        # kate
        # elisa
      ];

    # --- HYPRLAND SYSTEM LOGIC ---
    # Only enable the system-level Hyprland package if the toggle is on
    programs.hyprland.enable = lib.mkIf hypr.enable true;

    # --- THE "DISPLAY MANAGER WAR" ---
    # If Hyprland is enabled BUT KDE is disabled, use Greetd (your preferred lightweight greeter).
    # If KDE is enabled, it MUST control the greeter (SDDM), even if Hyprland is also there.
    services.greetd.enable = lib.mkIf (hypr.enable && !kde.enable) true;

    # --- PORTAL LOGIC ---
    # If both are enabled, prioritize KDE's portal to prevent conflicts (as we discussed before)
    xdg.portal = lib.mkIf (kde.enable && hypr.enable) {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-kde
        pkgs.xdg-desktop-portal-gtk
      ];
      config.common.default = [ "kde" ];
    };
  };
}
