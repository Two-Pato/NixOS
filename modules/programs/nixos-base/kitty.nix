{
  flake.homeModules.nixos-base = { lib, ... }: {
    programs.kitty = {
      enable = true;

      font = {
        name = lib.mkForce "JetBrainsMono Nerd Font";
        size = lib.mkForce 14;
      };

      settings = {
        bold_font = "auto";
        bold_italic_font = "auto";
        confirm_os_window_close = "0";
        cursor_blink_interval = "0.5";
        cursor_shape = "block";
        cursor_stop_blinking_after = "5";
        enable_audio_bell = "no";
        hide_window_decorations = "yes";
        initial_window_height = "500";
        initial_window_width = "950";
        italic_font = "auto";
        remember_window_size = "no";
        window_padding_width = "10";
      };
    };
  };
}
