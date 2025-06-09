{ config, lib, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

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
        enabled = true;
        border-radius = 15;
        cursor = mkLiteral "default";
      };

      mainbox = {
        enabled = true;
        spacing = 0;
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "horizontal";
        children = [ "imagebox" "listbox" ];
      };

      imagebox = {
        padding = 20;
        background-color = mkLiteral "transparent";
        background-image = mkLiteral "url(\"/etc/nixos/imgs/rofi_wallpaper.png\")";
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
        enabled = true;
        spacing = 10;
        padding = 15;
        border-radius = 10;
        children = [ "textbox-prompt-colon" "entry" ];
      };

      textbox-prompt-colon = {
        enabled = true;
        expand = false;
        str = " ";
        font = "JetBrainsMono Nerd Font 12";
      };

      entry = {
        enabled = true;
        cursor = "text";
        placeholder = "Search...";
      };

      listview = {
        enabled = true;
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
        cursor = "default";
      };

      element = {
        enabled = true;
        spacing = 15;
        padding = 8;
        border-radius = 10;
        background-color = mkLiteral "transparent";
        cursor = "pointer";
      };

      element-icon = {
        size = 32;
        cursor = "inherit";
      };

      element-text = {
        cursor = "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = 0;
      };

      message = {
        enabled = true;
      };

      textbox = {
        padding = 15;
        border-radius = 10;
        vertical-align = mkLiteral "0.5";
        horizontal-align = 0;
      };

      error-message = {
        padding = 15;
        border-radius = 20;
      };
    };
  };
}