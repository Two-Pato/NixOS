{
  flake.nixosModules.desktop-settings = { config, lib, ... }: {
    environment.variables = lib.mkMerge [
      {
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        GDK_BACKEND = "wayland";
        GDK_SCALE = "2";
        HYPRCURSOR_SIZE = "24";
        HYPRCURSOR_THEME = "Adwaita";
        NIXOS_OZONE_WL = 1;
        OZONE_PLATFORM = "wayland";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland";
        XCURSOR_SIZE = "24";
        XCURSOR_THEME = "Adwaita";
      }

      (lib.mkIf (config.networking.hostName == "mahiro") {
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        LIBVA_DRIVER_NAME = "nvidia";
      })
    ];
  };
}
