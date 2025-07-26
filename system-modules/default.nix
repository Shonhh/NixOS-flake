{ lib, config, pkgs, input, ... }: {
  imports = [
    ./fonts.nix
    ./stylix.nix

    ./services/default.nix
  ];
}
