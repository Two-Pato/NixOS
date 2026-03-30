{ config, ... }: {
  flake.homeModules.nixos-desktop = { lib, pkgs, osConfig, ... }: {
    stylix = {
      enable = true;
      autoEnable = false;

      targets = lib.mkMerge [
        {
          bat.enable = true;
          btop.enable = true;
          dunst.enable = true;
          hyprland.enable = true;
          hyprlock.enable = true;
          kitty.enable = true;
          lazygit.enable = true;
          rofi.enable = true;
          yazi.enable = true;
        }

        (lib.optionalAttrs (osConfig.networking.hostName == "mihari") {
          mpv.enable = true;
          zathura.enable = true;
        })
      ];

      image = ../../../assets/hyprland_wallpaper_1.png;

      base16Scheme = {
        base00 = "#${config.colors.base07-hex}";
        base01 = "#${config.colors.base06-hex}";
        base02 = "#${config.colors.base05-hex}";
        base03 = "#${config.colors.base04-hex}";
        base04 = "#${config.colors.base03-hex}";
        base05 = "#${config.colors.base02-hex}";
        base06 = "#${config.colors.base01-hex}";
        base07 = "#${config.colors.base00-hex}";
        base08 = "#${config.colors.base0D-hex}";
        base09 = "#${config.colors.base09-hex}";
        base0A = "#${config.colors.base0A-hex}";
        base0B = "#${config.colors.base0B-hex}";
        base0C = "#${config.colors.base0C-hex}";
        base0D = "#${config.colors.base08-hex}";
        base0E = "#${config.colors.base0E-hex}";
        base0F = "#${config.colors.base0F-hex}";
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
  };
}
