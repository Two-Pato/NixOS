{
  flake.homeModules.cli = {
    programs.yazi = {
      enable = true;

      shellWrapperName = "y";

      settings = {
        mgr = {
          linemode = "none";
          ratio = [
            1
            4
            3
          ];
          show_hidden = true;
          show_symlink = true;
          sort_by = "natural";
          sort_dir_first = true;
          sort_reverse = false;
          sort_sensitive = true;
        };

        open = {
          prepend_rules = [
            {
              url = "*.cbz";
              use = [
                "comic"
                "nvim"
              ];
            }
            {
              mime = "application/zip";
              use = [
                "comic"
                "nvim"
              ];
            }
          ];
        };

        opener = {
          comic = [
            {
              block = false;
              desc = "Zathura";
              run = ''zathura "$@"'';
            }
          ];

          nvim = [
            {
              block = true;
              desc = "Neovim";
              run = ''nvim "$@"'';
            }
          ];
        };

        preview = {
          image_filter = "lanczos3";
          image_quality = 90;
          max_height = 3000;
          max_width = 2000;
          tab_size = 2;
          wrap = "yes";
        };
      };
    };
  };
}
