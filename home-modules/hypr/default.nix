{
  lib,
  config,
  pkgs,
  input,
  ...
}:
{
  imports = [
    ./hyprpanel.nix
    ./hyprland.nix
    ./hypr-ecosystem.nix
  ];

  options.my.hyprland.enable = lib.mkEnableOption "Hyprland Ecosystem";
}
