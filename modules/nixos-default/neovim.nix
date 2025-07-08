{ config, lib, pkgs, ... }:

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

        #theme = {
        #  enable = true;
        #  name = "base16";
        #};

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
