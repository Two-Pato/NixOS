{ config, lib, pkgs, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    nautilus
    xdg-user-dirs
  ];

  home.file.".config/gtk-3.0/bookmarks".text = ''
    file:///home/laurent/Documents Documents
    file:///home/laurent/Downloads Downloads
    file:///home/laurent/Pictures Pictures
    file:///mnt/media Media
  '';

  home.file.".config/user-dirs.dirs".force = true;
  home.file.".config/user-dirs.dirs".text = ''
    XDG_DESKTOP_DIR="$HOME/Desktop"
    XDG_DOCUMENTS_DIR="$HOME/Documents"
    XDG_DOWNLOAD_DIR="$HOME/Downloads"
    XDG_MUSIC_DIR="$HOME/Music"
    XDG_PICTURES_DIR="$HOME/Pictures"
    XDG_VIDEOS_DIR="$HOME/Videos"
  '';

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
}