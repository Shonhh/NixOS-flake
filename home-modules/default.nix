{ lib, config, pkgs, input, ... }: {
  imports = [
    ./applications/default.nix
    ./desktop/default.nix
    ./development/default.nix
    ./hypr/default.nix
    ./services/default.nix
  ];
}
