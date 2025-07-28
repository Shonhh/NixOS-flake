{ lib, config, pkgs, input, ... }: {
  imports = [
    ./hyprpanel.nix
    ./hyprland.nix
  ];
}
