{ config, lib, pkgs, hostName, ... }:

let
  color = import ../../var/color.nix;
  wallpaper_mihari = ../../assets/hyprland_wallpaper_1.png;
  wallpaper_mahiro = ../../assets/hyprland_wallpaper_2.png;

  wallpaper_host =
    if hostName == "mihari" then wallpaper_mihari
    else if hostName == "mahiro" then wallpaper_mahiro
    else null;
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
        path = lib.mkForce "${wallpaper_host}";
        blur_passes = 3;
      };

      label = [
        # Time Display
        {
          text = "$TIME";
          font_size = 90;
          font_family = lib.mkForce "JetBrainsMono Nerd Font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        # Date Display
        {
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          font_size = lib.mkForce 25;
          font_family = lib.mkForce "JetBrainsMono Nerd Font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # User Avatar Display
      image = {
        path = "${../../assets/hyprlock_avatar.png}";
        size = 300;
        border_color = lib.mkForce "rgba(${color.base08-rgba})";
        position = "0, 200";
        halign = "center";
        valign = "center";
      };

      # Input Field Configuration
      input-field = {
        size = "300, 60";
        outline_thickness = 4;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = lib.mkForce "rgba(${color.base08-rgba})";
        fade_on_empty = false;
        placeholder_text = "<i>󰌾   Logged in as $USER</i>";
        hide_input = false;
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        position = "0, -47";
        halign = "center";
        valign = "center";
      };
    };
  };
}
