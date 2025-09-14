{ config, lib, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  color = import ../../var/color.nix;
in
{
  programs.rofi = {
    enable = true;

    extraConfig = {
      modi = "drun";
      font = "JetBrains Mono Nerd Font 12";
      show-icons = true;
      display-drun = "";
      drun-display-format = "{name}";
    };

    theme = {
      window = {
        transparency = "real";
        location = "center";
        anchor = "center";
        fullscreen = false;
        width = 1000;
        x-offset = 0;
        y-offset = 0;
        border-radius = 15;
        cursor = mkLiteral "default";
      };

      mainbox = {
        spacing = 0;
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "horizontal";
        children = [ "imagebox" "listbox" ];
        border = 2;
        border-radius = 15;
        border-color = mkLiteral "#${color.base08-hex}";
      };

      imagebox = {
        padding = 20;
        background-color = mkLiteral "transparent";
        background-image = mkLiteral "url(\"/etc/nixos/assets/rofi_wallpaper.png\", width)";
        orientation = "vertical";
        children = [ "inputbar" ];
      };

      listbox = {
        spacing = 20;
        padding = 20;
        background-color = mkLiteral "transparent";
        orientation = "vertical";
        children = [ "message" "listview" ];
      };

      inputbar = {
        spacing = 10;
        padding = 15;
        border-radius = 10;
        children = [ "textbox-prompt-colon" "entry" ];
      };

      textbox-prompt-colon = {
        expand = false;
        str = " ";
        font = "JetBrainsMono Nerd Font 12";
      };

      entry = {
        cursor = "text";
        placeholder = "Search...";
      };

      listview = {
        columns = 1;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = 10;
        background-color = mkLiteral "transparent";
      };

      element = {
        spacing = 15;
        padding = 8;
        border-radius = 10;
        background-color = mkLiteral "transparent";
      };

      element-icon = {
        size = 32;
      };

      element-text = {
        vertical-align = mkLiteral "0.5";
        horizontal-align = 0;
      };

      message = {
        padding = 10;
      };
    };
  };
}
