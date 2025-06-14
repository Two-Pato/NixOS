{ config, lib, pkgs, hostName, ... }:

let
  wallpaperMihari = ../imgs/hyprland_wallpaper_1.png;
  wallpaperMahiro = ../imgs/hyprland_wallpaper_2.png;

  selectedWallpaper =
    if hostName == "mihari" then wallpaperMihari
    else if hostName == "mahiro" then wallpaperMahiro
    else null;
in
{
  services.hyprpaper = lib.mkIf (selectedWallpaper != null) {
    enable = true;

    settings = {
      preload = [ "${selectedWallpaper}" ];
      wallpaper = [ ",${selectedWallpaper}" ];
    };
  };
}
