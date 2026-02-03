{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./stylix.nix
    ./greetd.nix
    ./hypr-environment.nix
  ];
}
