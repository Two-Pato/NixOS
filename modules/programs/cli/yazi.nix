{
  flake.homeModules.cli = {
    programs.yazi = {
      enable = true;

      shellWrapperName = "y";

      settings = {
        mgr = {
          ratio = [ 1 4 3 ];
          sort_by = "natural";
          sort_sensitive = true;
          sort_reverse = false;
          sort_dir_first = true;
          linemode = "none";
          show_hidden = true;
          show_symlink = true;
        };

        preview = {
          wrap = "yes";
          tab_size = 2;
          max_width = 2000;
          max_height = 3000;
          image_filter = "lanczos3";
          image_quality = 90;
        };

        opener = {
          comic = [
            { run = ''zathura "$@"''; block = false; desc = "Zathura"; }
          ];

          nvim = [
            { run = ''nvim "$@"''; block = true; desc = "Neovim"; }
          ];
        };

        open = {
          prepend_rules = [
            { url = "*.cbz"; use = [ "comic" "nvim" ]; }
            { mime = "application/zip"; use = [ "comic" "nvim" ]; }
          ];
        };
      };
    };
  };
}
