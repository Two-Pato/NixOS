{ config, lib, pkgs, ... }:

let
  color = import ../../var/color.nix;
in
{
  stylix = {
    enable = true;
    autoEnable = false;

    targets = {
      bat.enable = true;
      btop.enable = true;
      dunst.enable = true;
      fzf.enable = true;
      hyprland.enable = true;
      hyprlock.enable = true;
      kitty.enable = true;
      lazygit.enable = true;
      mpv.enable = true;
      nvf.enable = true;
      rofi.enable = true;
      yazi.enable = true;
    };

    image = ../../assets/hyprland_wallpaper_1.png;

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
