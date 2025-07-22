{ config, lib, pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = false;
      vimAlias = true;

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      # Language Server Protocol
      lsp = {
        enable = true;
      };

      languages = {
        nix.enable = true;
        html.enable = true;
        css.enable = true;
        bash.enable = true;
        python.enable = true;
        markdown.enable = true;
      };

      # Options
      options = {
        cursorline = true;
        showmode = false;
        undofile = true;

        # Tabs
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        autoindent = true;
      };

      # Gui
      theme = {
        enable = true;
        name = "github";
        style = "light";
        transparent = true;
      };

      statusline.lualine.enable = true;

      ui = {
        noice.enable = true;
        colorizer.enable = true;
      };

      # Plugins
      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
        context.enable = true;
      };

      filetree.nvimTree = {
        enable = true;
        openOnSetup = true;
      };

      telescope.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      # Keymaps
      globals.mapleader = " ";
      keymaps = [
        # Filetree
        {
          key = "<leader>ee";
          mode = "n";
          silent = true;
          action = "<cmd>NvimTreeToggle<CR>";
          desc = "Toggle file explorer";
        }
        {
          key = "<leader>ef";
          mode = "n";
          silent = true;
          action = "<cmd>NvimTreeFindFileToggle<CR>";
          desc = "Toggle file explorer on current file";
        }
        {
          key = "<leader>ec";
          mode = "n";
          silent = true;
          action = "<cmd>NvimTreeCollapse<CR>";
          desc = "Collapse file explorer";
        }
        {
          key = "<leader>er";
          mode = "n";
          silent = true;
          action = "<cmd>NvimTreeRefresh<CR>";
          desc = "Refresh file explorer";
        }
      ];
    };
  };
}
