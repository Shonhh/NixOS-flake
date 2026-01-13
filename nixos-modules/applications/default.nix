{ pkgs, ... }:
{
  imports = [
    ./spotify.nix
    ./steam.nix
    ./thunar.nix
    ./thunderbird.nix
    ./obsidian.nix
    ./dolphin-emu.nix
    ./virt-manager.nix
    ./obs-studio.nix
    ./vscode.nix
    # ... add more later
  ];
}
