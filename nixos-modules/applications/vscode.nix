{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      jdinhlife.gruvbox

      ms-vscode-remote.vscode-remote-extensionpack
      ms-vscode-remote.remote-ssh
      ms-vscode.remote-explorer
      ms-vscode-remote.remote-wsl
      ms-vscode-remote.remote-containers
      ms-vscode.makefile-tools
      vscodevim.vim
    ];
  };
}
