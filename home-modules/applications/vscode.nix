{ pkgs, ... }: {
  programs.vscode = {
    enable = true;

    defaultEditor = true;

    extensions = with pkgs.vscode-extensions; [
      # ... add more later
    ];
  };
}
