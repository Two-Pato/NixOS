{ config, lib, pkgs, ... }:

let
  color = import ../var/color.nix;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      # General settings
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
      };

      # Background configuration
      background = {
        path = "${../imgs/hyprland_wallpaper_1.png}";
        blur_passes = 3;
      };

      label = [
        # Time display
        {
          text = "$TIME";
          font_size = 90;
          font_family = lib.mkForce "JetBrainsMono Nerd Font";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        # Date display
        {
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          font_size = lib.mkForce 25;
          font_family = lib.mkForce "JetBrainsMono Nerd Font";
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # User avatar display
      image = {
        path = "${../imgs/hyprlock_avatar.png}";
        size = 300;
        border_color = lib.mkForce "rgba(${color.base08-rgba})";
        position = "0, 200";
        halign = "center";
        valign = "center";
      };

      # Input field configuration
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
