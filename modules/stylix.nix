{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    targets.yazi.enable = true;
    targets.kitty.enable = true;
    targets.dunst.enable = true;
    targets.mpv.enable = true;

    base16Scheme = {
      base00 = "1C1D21"; # Background / Black Russian
      base01 = "3A3C44"; # Black / Payne's Grey
      base02 = "575A66"; # Bright Black / Bright Grey
      base03 = "757989"; # Grey / Storm Grey
      base04 = "979AA7"; # Light Grey / Santas Grey
      base05 = "BABCC4"; # Foreground / Ghost
      base06 = "FBF9F8"; # White / Hint Of Red
      base07 = "FEFDFC"; # Bright White / Bianca
      base08 = "F0ACB7"; # Red / Cupid
      base09 = "F0D9D3"; # Orange / Pot Pourri
      base0A = "F4EEBA"; # Yellow / Cumulus
      base0B = "C1E0B6"; # Green / Fringy Flower
      base0C = "6BC7DE"; # Cyan / Malibu
      base0D = "BDE2F2"; # Blue / Pale Turquoise
      base0E = "C9A0CA"; # Magenta / Prelude
      base0F = "E26075"; # Dark Red or Brown / Froly
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
        package = pkgs.noto-fonts;
        name = "Noto Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}