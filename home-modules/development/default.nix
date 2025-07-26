{ lib, config, pkgs, ... }: {
  imports = [
    ./neovim.nix
    ./git.nix

    ./terminal/default.nix
  ];
}
