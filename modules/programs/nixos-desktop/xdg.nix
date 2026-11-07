{
  flake.homeModules.nixos-desktop = { pkgs, ... }: {
    xdg = {
      userDirs = {
        enable = true;

        createDirectories = true;
        setSessionVariables = false;
      };

      mimeApps = {
        enable = true;

        defaultApplications = {
          "application/pdf" = [ "zathura.desktop" ];
          "application/xml" = [ "org.gnome.TextEditor.desktop" ];
          "application/zip" = [ "org.gnome.Nautilus.desktop" ];
          "image/avif" = [ "org.gnome.gthumb.desktop" ];
          "image/bmp" = [ "org.gnome.gthumb.desktop" ];
          "image/gif" = [ "org.gnome.gthumb.desktop" ];
          "image/jpeg" = [ "org.gnome.gthumb.desktop" ];
          "image/png" = [ "org.gnome.gthumb.desktop" ];
          "image/webp" = [ "org.gnome.gthumb.desktop" ];
          "text/plain" = [ "org.gnome.TextEditor.desktop" ];
          "video/x-matroska" = [ "mpv.desktop" ];
        };
      };
    };

    home.packages = with pkgs; [
      xdg-user-dirs
    ];
  };
}
