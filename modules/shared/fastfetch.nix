{ config, lib, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "kitty";
        source = "${../../imgs/fastfetch_avatar.png}";
        height = 25;
      };

      display = {
        separator = "  ➜  ";
      };

      modules = [
        "break" "break" "break"

        # Operating System Section
        {
          type = "os";
          key = "OS   ";
          keyColor = "38;2;240;141;169"; # Red / Mauvelous
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "38;2;240;141;169";
        }
        {
          type = "packages";
          key = " ├ 󰏖 ";
          keyColor = "38;2;240;141;169";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "38;2;240;141;169";
        }

        "break"

        # Appearance Section
        {
          type = "wm";
          key = "WM   ";
          keyColor = "38;2;107;199;222"; # Cyan / Malibu
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "38;2;107;199;222";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "38;2;107;199;222";
        }
        {
          type = "cursor";
          key = " ├  ";
          keyColor = "38;2;107;199;222";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "38;2;107;199;222";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "38;2;107;199;222";
        }

        "break"

        # Hardware Information Section
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC   ";
          keyColor = "38;2;198;176;214"; # Magenta / Moon Raker
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = " ├  ";
          keyColor = "38;2;198;176;214";
        }
        {
          type = "gpu";
          format = "{1} {2} @ {12} GHz";
          key = " ├ 󰢮 ";
          keyColor = "38;2;198;176;214";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "38;2;198;176;214";
        }
        {
          type = "swap";
          key = " ├ 󰓡 ";
          keyColor = "38;2;198;176;214";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "38;2;198;176;214";
        }
        {
          type = "monitor";
          key = " └  ";
          keyColor = "38;2;198;176;214";
        }

        "break" "break"
      ];
    };
  };
}
