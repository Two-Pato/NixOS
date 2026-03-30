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
          "text/plain" = [ "org.gnome.TextEditor.desktop" ];
          "image/avif" = [ "org.gnome.gThumb.desktop" ];
          "video/x-matroska" = [ "mpv.desktop" ];
          "application/xml" = [ "org.gnome.TextEditor.desktop" ];
          "application/zip" = [ "org.gnome.Nautilus.desktop" ];
          "application/pdf" = [ "zathura.desktop" ];
        };
      };
    };

    home.packages = with pkgs; [
      xdg-user-dirs
    ];
  };
}
