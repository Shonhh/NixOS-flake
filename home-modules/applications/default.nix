{ lib, config, inputs, ... }: {
  imports = [
    ./clis/default.nix
    ./tuis/default.nix
    
    ./ghostty.nix
    ./discord.nix
    ./vscode.nix
  ];
}
