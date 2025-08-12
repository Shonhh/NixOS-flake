{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
    ./thunar.nix
    # ... add more later
  ];
}
