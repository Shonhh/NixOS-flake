{ lib, config, pkgs, ... }: {
  imports = [
    ./tuigreet.nix
    ./stylix.nix
    ./hypr-environment.nix
  ];
}
