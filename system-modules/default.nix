{ lib, config, pkgs, input, ... }: {
  imports = [
    ./fonts.nix

    ./services/default.nix
  ];
}
