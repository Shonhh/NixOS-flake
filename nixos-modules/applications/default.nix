{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
    ./thunar.nix
    ./thunderbird.nix
    ./obsidian.nix
    ./dolphin-emu.nix
    # ... add more later
  ];
}
