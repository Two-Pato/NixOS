{ config, lib, ... }:

{
  environment.variables = lib.mkMerge [
    {
      XCURSOR_THEME = "Adwaita";
      XCURSOR_SIZE = "24";
      HYPRCURSOR_THEME = "Adwaita";
      HYPRCURSOR_SIZE = "24";
      OZONE_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      GDK_BACKEND = "wayland";
      GDK_SCALE = "2";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland";
    }

    (lib.mkIf (config.networking.hostName == "mahiro") {
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    })
  ];
}
