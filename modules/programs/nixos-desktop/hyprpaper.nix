{
  flake.homeModules.nixos-desktop = { lib, osConfig, ... }:
  let
    wallpapers = {
      mahiro = ../../../assets/hyprland_wallpaper_2.png;
      mihari = ../../../assets/hyprland_wallpaper_1.png;
    };

    wallpaper_host = wallpapers.${osConfig.networking.hostName} or null;
  in
  {
    services.hyprpaper = lib.mkIf (wallpaper_host != null) {
      enable = true;

      settings = {
        splash = false;

        wallpaper = [
          {
            fit_mode = "cover";
            monitor = "";
            path = "${wallpaper_host}";
          }
        ];
      };
    };
  };
}
