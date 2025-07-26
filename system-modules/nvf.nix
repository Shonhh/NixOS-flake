{ pkgs, lib, ... }: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      theme = {
        enable = true;
	name = "catppuccin";
      };

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      languages = {
        enableLSP = true;
	enableTreesitter = true;

	nix.enable = true;
	rust.enable = true;
	python.enable = true;
	java.enable = true;
      };
    };
  };
}
