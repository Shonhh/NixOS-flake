{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
    # ... add more later
  ];
}
