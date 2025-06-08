{ config, lib, pkgs, ... }:

let
  color = import ../var/color.nix;
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrains Mono Nerd Font";
      size = 14;
    };

    settings = {
      # General settings
      confirm_os_window_close = "0";

      # Font settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Window settings
      remember_window_size = "no";
      initial_window_width = "950";
      initial_window_height = "500";
      window_padding_width = "10";
      hide_window_decorations = "yes";

      # Cursor settings
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "5";

      # Audio bell settings
      enable_audio_bell = "no";

      # Background settings
      background_opacity = "0.8";
    };

    home.file.".config/kitty/themes/Onimai.conf".text = ''
      # vim:ft=kitty

      ## name:     base24 Onimai
      ## author:   Two-Pato
      ## license:  MIT
      ## upstream: https://github.com/tinted-theming/tinted-terminal
      ## blurb:

      # Scheme name: base24 Onimai
      # Scheme author: Two-Pato
      # Template author: Tinted Theming (https://github.com/tinted-theming/tinted-terminal)

      # The basic colors
      background ${color.base00-hex}
      foreground ${color.base05-hex}
      selection_background ${color.base05-hex}
      selection_foreground ${color.base00-hex}

      # Cursor colors
      cursor ${color.base05-hex}
      cursor_text_color ${color.base00-hex}

      # URL underline color when hovering with mouse
      url_color ${color.base04-hex}

      # Kitty window border colors
      active_border_color ${color.base03-hex}
      inactive_border_color ${color.base01-hex}

      # OS Window titlebar colors
      wayland_titlebar_color ${color.base00-hex}
      macos_titlebar_color ${color.base00-hex}

      # Tab bar colors
      active_tab_background ${color.base00-hex}
      active_tab_foreground ${color.base05-hex}
      inactive_tab_background ${color.base01-hex}
      inactive_tab_foreground ${color.base04-hex}
      tab_bar_background ${color.base01-hex}

      # The 16 terminal colors
      # normal
      color0 ${color.base00-hex}
      color1 ${color.base08-hex}
      color2 ${color.base0B-hex}
      color3 ${color.base0A-hex}
      color4 ${color.base0D-hex}
      color5 ${color.base0E-hex}
      color6 ${color.base0C-hex}
      color7 ${color.base05-hex}

      # bright
      color8 ${color.base02-hex}
      color9 ${color.base09-hex}
      color10 ${color.base12-hex}
      color11 ${color.base13-hex}
      color12 ${color.base14-hex}
      color13 ${color.base15-hex}
      color14 ${color.base16-hex}
      color15 ${color.base17-hex}

      # extended base16 colors
      color16 ${color.base09-hex}
      color17 ${color.base0F-hex}
      color18 ${color.base01-hex}
      color19 ${color.base02-hex}
      color20 ${color.base04-hex}
      color21 ${color.base06-hex}
    '';
  };
}
