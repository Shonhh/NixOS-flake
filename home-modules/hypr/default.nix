{ lib, config, pkgs, input, ... }: {
  imports = [
    ./hyprpanel.nix
    ./hyprland.nix
    ./hypr-ecosystem.nix
  ];
}
