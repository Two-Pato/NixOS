{ config, lib, pkgs, ... }:

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
    };
  };
}