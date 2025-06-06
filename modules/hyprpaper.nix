{ config, lib, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${../imgs/hyprland_wallpaper.png}"
      ];
      wallpaper = [
        ", ${../imgs/hyprland_wallpaper.png}"
      ];
    };
  };
}
