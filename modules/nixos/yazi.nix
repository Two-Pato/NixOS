{ config, lib, pkgs, ... }:

{
  programs.yazi = {
    enable = true;

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
        tab_size = 2;
        max_width = 2000;
        max_height = 3000;
        cache_dir = "";
        image_filter = "lanczos3";
        image_quality = 90;
      };
    };
  };
}
