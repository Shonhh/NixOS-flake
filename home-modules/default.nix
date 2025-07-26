{ lib, config, pkgs, input, ... }: {
  imports = [
    ./stylix.nix

    ./applications/default.nix
    ./desktop/default.nix
    ./development/default.nix
    ./hypr/default.nix
  ];
}
