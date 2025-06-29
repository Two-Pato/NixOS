{ config, lib, pkgs, ... }:

let
  color = import ../../var/color.nix;
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = lib.mkForce "JetBrains Mono Nerd Font";
      size = lib.mkForce 14;
    };

    settings = {
      # General Settings
      confirm_os_window_close = "0";

      # Font Settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Window Settings
      remember_window_size = "no";
      initial_window_width = "950";
      initial_window_height = "500";
      window_padding_width = "10";
      hide_window_decorations = "yes";

      # Cursor Settings
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "5";

      # Audio Bell Settings
      enable_audio_bell = "no";
    };
  };
}
