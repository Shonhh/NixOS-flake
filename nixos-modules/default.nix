{
  lib,
  config,
  pkgs,
  input,
  ...
}:
{
  imports = [
    ./fonts.nix
    ./libraries.nix
    ./desktop-flow.nix

    ./applications/default.nix
    ./services/default.nix
  ];
}
