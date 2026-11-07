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

    home.file.".local/share/applications/org.gnome.gthumb.desktop".text = ''
      [Desktop Entry]
      Name=Thumbnails
      Categories=GNOME;GTK;Graphics;Viewer;RasterGraphics;2DGraphics;Photography;
      Exec=gthumb --new-window %U
      MimeType=image/png;image/apng;image/jpeg;image/webp;image/svg+xml;image/jxl;image/heif;image/heic;image/avif;image/tiff;image/gif;
      Comment=View and organize your images
      Icon=org.gnome.gthumb
      StartupNotify=true
      Terminal=false
      Type=Application
    '';
  };
}
