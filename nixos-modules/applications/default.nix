{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
    ./thunar.nix
    ./thunderbird.nix
    # ... add more later
  ];
}
