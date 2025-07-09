{ config, lib, pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = false;
      vimAlias = true;

      lsp = {
        enable = true;
      };

      # Options
      options = {
        showmode = false;
      };

      # Theme
      theme = {
        enable = true;
        name = "github";
        style = "light";
        transparent = true;
      };

      statusline.lualine.enable = true;

      ui.noice.enable = true;

      mini.icons.enable = true;

      # Plugins
      filetree.nvimTree = {
        enable = true;
        openOnSetup = true;
      };

      telescope.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };
    };
  };
}
