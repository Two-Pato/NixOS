{ config, lib, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [ "${../imgs/hyprland_wallpaper_1.png}" ];
      wallpaper = [ ", ${../imgs/hyprland_wallpaper_1.png}" ];
    };
  };
}