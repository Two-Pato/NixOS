{ config, lib, pkgs, ... }:

let
  color = import ../var/color.nix;
in
{
  stylix = {
    enable = true;
    autoEnable = false;
    targets.yazi.enable = true;
    targets.kitty.enable = true;
    targets.dunst.enable = true;
    targets.mpv.enable = true;
    targets.hyprland.enable = true;
    targets.hyprlock.enable = true;
    targets.rofi.enable = true;
    targets.btop.enable = true;
    targets.fzf.enable = true;

    base16Scheme = {
      base00 = "#${color.base07-hex}";
      base01 = "#${color.base06-hex}";
      base02 = "#${color.base05-hex}";
      base03 = "#${color.base04-hex}";
      base04 = "#${color.base03-hex}";
      base05 = "#${color.base02-hex}";
      base06 = "#${color.base01-hex}";
      base07 = "#${color.base00-hex}";

      base08 = "#${color.base0D-hex}";
      base09 = "#${color.base09-hex}";
      base0A = "#${color.base0A-hex}";
      base0B = "#${color.base0B-hex}";
      base0C = "#${color.base0C-hex}";
      base0D = "#${color.base08-hex}";
      base0E = "#${color.base0E-hex}";
      base0F = "#${color.base0F-hex}";
    };

    image = ../imgs/hyprland_wallpaper.png;

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}