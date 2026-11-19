{
  flake.homeModules.nixos-base = { pkgs, ... }: {
    dconf.settings = {
      "org/gnome/gthumb" = {
        reuse-active-window = false;
        sort-type = "file::name";
        sort-inverse = false;
        store-metadata-in-files = false;
      };

      "org/gnome/gthumb/savers/jpeg" = {
        default-ext = "jpg";
      };

      "org/gnome/gthumb/viewers/images" = {
        scroll-action = "change-file";
        transparency = "checkered";
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
  };
}
