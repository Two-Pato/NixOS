{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    xdg-user-dirs
  ];

  xdg = {
    userDirs = {
      enable = true;

      createDirectories = true;
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "text/plain" = [ "org.gnome.TextEditor.desktop" ];
        "image/avif" = [ "org.gnome.gThumb.desktop" ];
        "video/x-matroska" = [ "mpv.desktop" ];
        "application/xml" = [ "org.gnome.TextEditor.desktop" ];
        "application/zip" = [ "org.gnome.Nautilus.desktop" ];
        "application/pdf" = [ "zathura.desktop" ];
      };
    };
  };
}