{ config, lib, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "kitty";
        source = "${../imgs/fastfetch_avatar.png}";
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
          keyColor = "38;2;240;172;183"; # Cherry Blossom Pink
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "38;2;240;172;183";
        }
        {
          type = "packages";
          key = " ├ 󰏖 ";
          keyColor = "38;2;240;172;183";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "38;2;240;172;183";
        }

        "break"

        # Appearance Section
        {
          type = "wm";
          key = "WM   ";
          keyColor = "38;2;189;226;242"; # Columbia Blue
        }
        {
          type = "wmtheme";
          key = " ├ 󰉼 ";
          keyColor = "38;2;189;226;242";
        }
        {
          type = "icons";
          key = " ├ 󰀻 ";
          keyColor = "38;2;189;226;242";
        }
        {
          type = "cursor";
          key = " ├  ";
          keyColor = "38;2;189;226;242";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "38;2;189;226;242";
        }
        {
          type = "terminalfont";
          key = " └  ";
          keyColor = "38;2;189;226;242";
        }

        "break"

        # Hardware Information Section
        {
          type = "host";
          format = "{5} {1} Type {2}";
          key = "PC   ";
          keyColor = "38;2;244;238;186"; # Lemon Chiffon
        }
        {
          type = "cpu";
          format = "{1} ({3}) @ {7} GHz";
          key = " ├  ";
          keyColor = "38;2;244;238;186";
        }
        {
          type = "gpu";
          format = "{1} {2} @ {12} GHz";
          key = " ├ 󰢮 ";
          keyColor = "38;2;244;238;186";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "38;2;244;238;186";
        }
        {
          type = "swap";
          key = " ├ 󰓡 ";
          keyColor = "38;2;244;238;186";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "38;2;244;238;186";
        }
        {
          type = "monitor";
          key = " └  ";
          keyColor = "38;2;244;238;186";
        }

        "break" "break"
      ];
    };
  };
}
