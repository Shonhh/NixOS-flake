{ pkgs, ... }: {
  imports = [
    ./spotify.nix
    ./steam.nix
    ./thunar.nix
    ./vscode.nix
    # ... add more later
  ];
}
