{ lib, config, pkgs, input, ... }: {
  imports = [
    ./fonts.nix
    ./libraries.nix

    ./applications/default.nix
    ./services/default.nix
  ];
}
