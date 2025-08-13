{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        usernamehw.errorlens
        github.vscode-pull-request-github
        eamodio.gitlens
      ];

      userSettings = {
        nix.serverPath = "nixd";
        nix.enableLanguageServer = true;
        nix.serverSettings = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };

        workbench.colorTheme = "Catppuccin Mocha";

        editor.semanticHighlighting.enabled = true;
        terminal.integrated.minimumContrastRatio = 1;
        window.titleBarStyle = "custom";

        gopls = {
          ui.semanticTokens = true;
        };
      };
    };
  };
}
