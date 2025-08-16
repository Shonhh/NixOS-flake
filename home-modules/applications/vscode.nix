{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Theming
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        usernamehw.errorlens
        
        # Nix
        jnoortheen.nix-ide

        # Java
        redhat.java
        vscjava.vscode-java-dependency
        vscjava.vscode-java-debug
        vscjava.vscode-java-test

        # Git
        github.vscode-pull-request-github
        eamodio.gitlens
      ];

      userSettings = {
        # Nix
        nix.serverPath = "nixd";
        nix.enableLanguageServer = true;
        nix.serverSettings = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };
          };
        };

        workbench = {
          colorTheme = "Catppuccin Mocha";
          sideBar.location = "right";
        };

        workbench.iconTheme = "catppuccin-mocha";

        editor.semanticHighlighting.enabled = true;
        terminal.integrated.minimumContrastRatio = 1;
        window.titleBarStyle = "custom";
        git.openRepositoryInParentFolders = "always";

        gopls = {
          ui.semanticTokens = true;
        };

        github.copilot.nextEditSuggestions = {
          enabled = false;
          fixes = false;
        };
      };
    };
  };
}
