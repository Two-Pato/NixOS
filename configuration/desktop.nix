{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  stylix = {
    enable = true;
    autoEnable = false;
    image = ../../assets/hyprland_wallpaper_1.png;
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
}
