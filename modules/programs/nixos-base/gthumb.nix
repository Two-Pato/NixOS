{
  flake.homeModules.nixos-base = { lib, pkgs, ... }: with lib.hm.gvariant; {
    dconf.settings = {
      "org/gnome/gthumb" = {
        sort-type = "file::name";
        sort-inverse = false;
      };
    };

    home.packages = with pkgs; [
      gthumb
    ];

    home.file.".config/gthumb/shortcuts.xml".text = ''
      <?xml version="1.0" encoding="UTF-8"?>
      <shortcuts version="1.0">
        <shortcut action="win.edit-metadata"/>
        <shortcut accelerator="c" action="viewer.crop"/>
      </shortcuts>
    '';

    home.file.".local/share/applications/org.gnome.gThumb.desktop".text = ''
      [Desktop Entry]
      Name=Thumbnails
      Categories=GNOME;GTK;Graphics;2DGraphics;Viewer;
      Exec=gthumb --new-window %U
      MimeType=image/jpeg;image/png;image/webp;image/gif;image/bmp;image/tiff;image/svg+xml;image/avif;image/heif;image/jxl;
      Comment=Browse and view images
      Icon=org.gnome.gThumb
      StartupNotify=true
      Terminal=false
      Type=Application
    '';
  };
}
