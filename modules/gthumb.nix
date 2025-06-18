{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    gthumb
  ];

  dconf.settings = {
    "org/gnome/gthumb/browser" = {
      statusbar-visible = false;
      sort-type = "file::name";
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

  home.file.".config/gthumb/shortcuts.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <shortcuts>
      <shortcut accelerator="Up" action="show-first-image"/>
      <shortcut accelerator="Down" action="show-last-image"/>
      <shortcut accelerator="Right" action="show-next-image"/>
      <shortcut accelerator="Left" action="show-previous-image"/>

      <shortcut accelerator="&lt;Primary&gt;Down" action="scroll-step-down"/>
      <shortcut accelerator="&lt;Primary&gt;Left" action="scroll-step-left"/>
      <shortcut accelerator="&lt;Primary&gt;Right" action="scroll-step-right"/>
      <shortcut accelerator="&lt;Primary&gt;Up" action="scroll-step-up"/>

      <shortcut accelerator="&lt;Shift&gt;c" action="edit-metadata"/>
      <shortcut accelerator="c" action="file-tool-crop"/>
    </shortcuts>
  '';
}
