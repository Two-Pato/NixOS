{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    nautilus
    xdg-user-dirs
  ];

  dconf.settings = {
    "org/gnome/nautilus/icon-view" = {
      captions = [ "size" "none" "none" ];
      default-zoom-level = "large";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      executable-text-activation = "ask";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };
  };

  xdg.userDirs = { 
    enable = true;
    createDirectories = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" =  [ "org.gnome.TextEditor.desktop" ];
      "application/xml" = [ "org.gnome.TextEditor.desktop" ];
      "application/zip" = [ "org.gnome.Nautilus.desktop" ];
    };
  };

  home.file.".config/gtk-3.0/bookmarks".text = ''
    file:///home/laurent/Documents Documents
    file:///home/laurent/Downloads Downloads
    file:///home/laurent/Pictures Pictures
    file:///mnt/media Media
  '';
}
