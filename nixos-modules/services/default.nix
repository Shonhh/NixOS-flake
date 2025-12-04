{ lib, config, pkgs, ... }: {
  imports = [
    ./greetd.nix
    ./stylix.nix
    ./hypr-environment.nix
  ];
}
