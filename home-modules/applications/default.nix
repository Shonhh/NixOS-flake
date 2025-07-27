{ lib, config, ... }: {
  imports = [
    ./clis/default.nix
    ./tuis/default.nix
    
    ./ghostty.nix
    ./discord.nix
  ];
}
