{ config, lib, pkgs, ... }:

let
  hostname = config.networking.hostName;
  wp1 = ../imgs/hyprland_wallpaper1.png;
  wp2 = ../imgs/hyprland_wallpaper2.png;
in
{
  services.hyprpaper = {
    enable = true;

    settings = lib.mkMerge [
      (lib.mkIf (hostname == "mihari") {
        preload = [ "${wp1}" ];
        wallpaper = [ ",${wp1}" ];
      })

      (lib.mkIf (hostname == "mahiro") {
        preload = [ "${wp2}" ];
        wallpaper = [ ",${wp2}" ];
      })
    ];
  };
}
