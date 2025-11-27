{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = (pkgs.wrapWithWaylandFlags pkgs.vscode);

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Theming
        jdinhlife.gruvbox
        pkief.material-icon-theme
        usernamehw.errorlens

        # Control Scheme
        vscodevim.vim

        # Nix
        jnoortheen.nix-ide

        # Java
        redhat.java
        vscjava.vscode-java-dependency
        vscjava.vscode-java-debug
        vscjava.vscode-java-test

        # Rust
        fill-labs.dependi
        rust-lang.rust-analyzer

        # TOML
        tamasfe.even-better-toml

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
          colorTheme = "Gruvbox Dark Hard";
          sideBar.location = "right";
          iconTheme = "material-icon-theme";
        };

        editor = {
          semanticHighlighting.enabled = true;
          detectIndentation = false;
          tabSize = 4;
          wordWrapColumn = 100;
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
