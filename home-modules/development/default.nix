{ lib, config, ... }: {
  imports = [
    ./git.nix
    ./neovim.nix
  ];
}
