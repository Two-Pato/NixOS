{
  flake.homeModules.nixos-desktop = { lib, osConfig, ... }:
  let
    wallpapers = {
      mihari = ../../../assets/hyprland_wallpaper_1.png;
      mahiro = ../../../assets/hyprland_wallpaper_2.png;
    };

    wallpaper_host = wallpapers.${osConfig.networking.hostName} or null;
  in {
    services.hyprpaper = lib.mkIf (wallpaper_host != null) {
      enable = true;

      settings = {
        splash = false;
        wallpaper = [
          {
            monitor = "";
            path = "${wallpaper_host}";
            fit_mode = "cover";
          }
        ];
      };
    };
  };
}
