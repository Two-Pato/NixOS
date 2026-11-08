{ config, ... }:
{
  flake.homeModules.nixos-desktop = { lib, osConfig, ... }:
  let
    wallpapers = {
      mahiro = ../../../assets/hyprland_wallpaper_2.png;
      mihari = ../../../assets/hyprland_wallpaper_1.png;
    };

      wallpaper_host = wallpapers.${osConfig.networking.hostName} or null;
  in
  {
    programs.hyprlock = lib.mkIf (wallpaper_host != null) {
      enable = true;

      settings = {
        # General Settings
        general = {
          disable_loading_bar = true;
          hide_cursor = false;
        };

        # Background Configuration
        background = {
          blur_passes = 3;
          path = lib.mkForce "${wallpaper_host}";
        };

        label = [
          # Time Display
          {
            font_family = lib.mkForce "JetBrainsMono Nerd Font";
            font_size = 90;
            halign = "right";
            position = "-30, 0";
            text = "$TIME";
            valign = "top";
          }

          # Date Display
          {
            font_family = lib.mkForce "JetBrainsMono Nerd Font";
            font_size = lib.mkForce 25;
            halign = "right";
            position = "-30, -150";
            text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
            valign = "top";
          }
        ];

        # User Avatar Display
        image = {
          border_color = lib.mkForce "rgba(${config.colors.base08-rgba})";
          halign = "center";
          path = "${../../../assets/hyprlock_avatar.png}";
          position = "0, 200";
          size = 300;
          valign = "center";
        };

        # Input Field Configuration
        input-field = {
          dots_center = true;
          dots_size = 0.2;
          dots_spacing = 0.2;
          fade_on_empty = false;
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          halign = "center";
          hide_input = false;
          outer_color = lib.mkForce "rgba(${config.colors.base08-rgba})";
          outline_thickness = 4;
          placeholder_text = "<i>󰌾   Logged in as $USER</i>";
          position = "0, -47";
          size = "300, 60";
          valign = "center";
        };
      };
    };
  };
}
