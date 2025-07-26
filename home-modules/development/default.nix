{ lib, config, ... }: {
  imports = [
    ./fish.nix
    ./neovim.nix
    ./git.nix
  ];
}
