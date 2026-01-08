{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "HTML"
      "TOML"
      "Git Firefly"
      "Java"
      "Nix"
      "Colored Zed Icons Theme"
      "Gruvbox Baby"
    ];

    userSettings = {
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      agent = {
        dock = "left";
      };

      title_bar = {
        show_sign_in = false;
        show_user_picture = false;
        show_branch_icon = false;
      };

      project_panel = {
        dock = "right";
        button = true;
      };

      diagnostics = {
        inline = {
          enable = true;
        };
      };

      colorize_brackets = true;
      inlay_hints = {
        enabled = false;
      };

      relative_line_numbers = "enabled";
      sticky_scroll = {
        enabled = true;
      };

      use_system_prompts = false;
      use_system_path_prompts = false;

      indent_guides = {
        background_coloring = "disabled";
        coloring = "indent_aware";
      };

      minimap = {
        thumb = "always";
        show = "auto";
      };

      vim-mode = true;

      icon_theme = "Colored Zed Icons Theme Dark";

      buffer_font_family = "Fira Code Nerd Font";
      buffer_font_size = 16.0;
      theme = "Gruvbox Baby";

      ui_font_family = "Lato";
      ui_font_size = 16.0;
    };

    userTasks = [
      {
        label = "Rust: Run";
        command = "cargo run";
        cwd = "$ZED_WORKTREE_ROOT";
        use_new_terminal = false;
        allow_concurrent_runs = false;
        reveal = "always";
      }
      {
        label = "C: Run";
        command = "gcc $ZED_FILE -o main && ./main";
        use_new_terminal = false;
        allow_concurrent_runs = false;
        reveal = "always";
      }
    ];

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "ctrl-n" = "task::Spawn";
          "ctrl-alt-n" = "task::Rerun";
        };
      }
    ];
  };
}
