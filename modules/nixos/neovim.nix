{ config, lib, pkgs, ... }:

let
  color = import ../../var/color.nix;
in
{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = false;
      vimAlias = true;
      preventJunkFiles = true;

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      # Language Server Protocol
      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
        lightbulb.enable = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        html.enable = true;
        css.enable = true;
        bash.enable = true;
        python.enable = true;

        markdown = {
          enable = true;
          extensions.render-markdown-nvim.enable = true;
        };
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

      visuals = {
        nvim-web-devicons.enable = true;
      };

      statusline.lualine.enable = true;

      notify.nvim-notify = {
        enable = true;
        setupOpts.background_colour = "#${color.base07-hex}";
      };

      ui = {
        breadcrumbs.enable = true;
        colorizer.enable = true;
        noice.enable = true;
      };

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
