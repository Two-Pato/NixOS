{ config, lib, pkgs, ... }:

let
  # Define color variables
  accent = "rgba(149, 117, 128, 1)";
  accentAlpha = "rgba(244, 238, 186, 1)";
  surface = "rgba(251, 249, 248, 1)";
  text = "rgba(28, 29, 33, 1)";
  textAlpha = "rgba(28, 29, 33, 1)";
  font = "JetBrainsMono Nerd Font";
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
        path = "${../imgs/hyprland_wallpaper.png}";
        blur_passes = 3;
        color = surface;
      };

      label = [
        # Time display
        {
          text = "$TIME";
          color = text;
          font_size = 90;
          font_family = font;
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }
        # Date display
        {
          text = "cmd[update:43200000] date +\"%A, %d %B %Y\"";
          color = text;
          font_size = 25;
          font_family = font;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # User avatar display
      image = {
        path = "${../imgs/hyprlock_avatar.png}";
        size = 300;
        border_color = accent;
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
        outer_color = accent;
        inner_color = surface;
        font_color = text;
        fade_on_empty = false;
        placeholder_text = "<i>󰌾   Logged in as $USER</i>";
        hide_input = false;
        check_color = accent;
        fail_color = "rgba(149, 117, 128, 1)";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "rgba(149, 117, 128, 1)";
        position = "0, -47";
        halign = "center";
        valign = "center";
      };
    };
  };
}
