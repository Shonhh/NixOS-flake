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
  };
}
