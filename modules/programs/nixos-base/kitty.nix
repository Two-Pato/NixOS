{
  flake.homeModules.nixos-base = { lib, ... }: {
    programs.kitty = {
      enable = true;

      font = {
        name = lib.mkForce "JetBrains Mono Nerd Font";
        size = lib.mkForce 14;
      };

      settings = {
        confirm_os_window_close = "0";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        remember_window_size = "no";
        initial_window_width = "950";
        initial_window_height = "500";
        window_padding_width = "10";
        hide_window_decorations = "yes";
        cursor_shape = "block";
        cursor_blink_interval = "0.5";
        cursor_stop_blinking_after = "5";
        enable_audio_bell = "no";
      };
    };
  };
}
