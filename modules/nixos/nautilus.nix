{ config, lib, pkgs, hostName, ... }:

with lib.hm.gvariant;

{
  home.packages = with pkgs; [
    nautilus
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
      show-image-thumbnails = "always";
      thumbnail-limit = 10;
    };
  };

  home.file.".config/gtk-3.0/bookmarks".text = ''
    file:///home/laurent/Documents Documents
    file:///home/laurent/Downloads Downloads
    file:///home/laurent/Pictures Pictures
    file:///home/laurent/Videos Videos
    ${lib.strings.optionalString (hostName == "mihari") "file:///mnt/media Media"}
    ${lib.strings.optionalString (hostName == "mahiro") "file:///mnt/videogames Games"}
  '';
}
