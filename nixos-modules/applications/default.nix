{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
    ./thunar.nix
    ./thunderbird.nix
    ./obsidian.nix
    # ... add more later
  ];
}
