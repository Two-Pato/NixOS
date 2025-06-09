{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    stylix.autoEnable = false;
    stylix.targets.yazi.enable = true;

    
    stylix.image = ../imgs/hyprland_wallpaper.png;

  }
}