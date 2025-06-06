{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    gthumb
  ];

  dconf.settings = {
    "org/gnome/gthumb/browser" = {
      statusbar-visible = false;
    };

    "org/gnome/gthumb/general" = {
      active-extensions = [
        "resize_images"
        "image_print"
        "search"
        "list_tools"
        "convert_format"
        "exiv2_tools"
        "edit_metadata"
        "find_duplicates"
        "rename_series"
        "photo_importer"
        "raw_files"
        "gstreamer_tools"
        "catalogs"
        "desktop_background"
        "change_date"
        "contact_sheet"
        "image_rotation"
        "selections"
        "bookmarks"
        "terminal"
        "file_manager"
        "red_eye_removal"
        "comments"
        "slideshow"
      ];
      store-metadata-in-files = false;
    };

    "org/gnome/gthumb/pixbuf-savers/jpeg" = {
      default-ext = "jpeg";
      optimize = true;
      progressive = false;
      quality = 100;
      smoothing = 0;
    };
  };
}
