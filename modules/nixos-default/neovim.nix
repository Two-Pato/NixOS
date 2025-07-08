{ config, lib, pkgs, ... }:

let
  color = import ../../var/color.nix;
in
{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = false;
        vimAlias = true;

        lsp = {
          enable = true;
        };

        # Plugins
        statusline.lualine.enable = true;

        filetree.nvimTree = {
          enable = true;
          openOnSetup = true;
        };

        binds.whichKey.enable = true;
      };
    };
  };
}
