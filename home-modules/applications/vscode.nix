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

        # Formatting
        esbenp.prettier-vscode

        # Control Scheme
        vscodevim.vim

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

        # Java
        "[java]" = {
          editor.defaultFormatter = "redhat.java";
        };

        vim = {
          leader = "<space>";
          easymotion = true;
          incsearch = true;
          useSystemClipboard = true;
        };

        # To improve performance
        extensions.experimental.affinity = {
          "vscodevim.vim" = 1;
        };

        workbench = {
          colorTheme = "Catppuccin Mocha";
          sideBar.location = "right";
          iconTheme = "catppuccin-mocha";
        };

        editor = {
          defaultFormatter = "esbenp.prettier-vscode";
          semanticHighlighting.enabled = true;
          detectIndentation = false;
          tabSize = 4;
        };

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
