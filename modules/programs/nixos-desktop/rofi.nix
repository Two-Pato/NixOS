{ config, ... }:
{
  flake.homeModules.nixos-desktop = hmConfig:
  let
    inherit (hmConfig.config.lib.formats.rasi) mkLiteral;
  in
  {
    programs.rofi = {
      enable = true;

      settings = {
        display-drun = "";
        drun-display-format = "{name}";
        font = "JetBrainsMono Nerd Font 12";
        modi = "drun";
        show-icons = true;
      };

      theme = {
        window = {
          anchor = "center";
          border-radius = 15;
          cursor = mkLiteral "default";
          fullscreen = false;
          location = "center";
          transparency = "real";
          width = 1000;
          x-offset = 0;
          y-offset = 0;
        };

        mainbox = {
          background-color = mkLiteral "transparent";
          border = 2;
          border-color = mkLiteral "#${config.colors.base08-hex}";
          border-radius = 15;
          children = [
            "imagebox"
            "listbox"
          ];

          orientation = mkLiteral "horizontal";
          spacing = 0;
        };

        imagebox = {
          background-color = mkLiteral "transparent";
          background-image = mkLiteral "url(\"/etc/nixos/assets/rofi_wallpaper.png\", width)";
          children = [ "inputbar" ];
          orientation = "vertical";
          padding = 20;
        };

        listbox = {
          background-color = mkLiteral "transparent";
          children = [
            "message"
            "listview"
          ];

          orientation = "vertical";
          padding = 20;
          spacing = 20;
        };

        inputbar = {
          border-radius = 10;
          children = [
            "textbox-prompt-colon"
            "entry"
          ];

          padding = 15;
          spacing = 10;
        };

        textbox-prompt-colon = {
          expand = false;
          font = "JetBrainsMono Nerd Font 12";
          str = " ";
        };

        entry = {
          cursor = "text";
          placeholder = "Search...";
        };

        listview = {
          background-color = mkLiteral "transparent";
          columns = 1;
          cycle = true;
          dynamic = true;
          fixed-columns = true;
          fixed-height = true;
          layout = "vertical";
          lines = 8;
          reverse = false;
          scrollbar = false;
          spacing = 10;
        };

        element = {
          background-color = mkLiteral "transparent";
          border-radius = 10;
          padding = 8;
          spacing = 15;
        };

        element-icon = {
          size = 32;
        };

        element-text = {
          horizontal-align = 0;
          vertical-align = mkLiteral "0.5";
        };

        message = {
          padding = 10;
        };
      };
    };
  };
}
