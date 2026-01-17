{ config, lib, pkgs, hostName, ... }:

let
  wallpaper_mihari = ../../assets/hyprland_wallpaper_1.png;
  wallpaper_mahiro = ../../assets/hyprland_wallpaper_2.png;

  wallpaper_host =
    if hostName == "mihari" then wallpaper_mihari
    else if hostName == "mahiro" then wallpaper_mahiro
    else null;
in
{
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
}
