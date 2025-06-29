{ config, lib, pkgs, ... }:

let
  color = import ../../var/color.nix;
in
{
  services.clipse = {
    enable = true;

    allowDuplicates = false;
    historySize = 100;

    keyBindings = {
      choose = "enter";
      clearSelected = "S";
      down = "down";
      end = "end";
      filter = "/";
      home = "home";
      more = "?";
      nextPage = "right";
      prevPage = "left";
      preview = " ";
      quit = "q";
      remove = "x";
      selectDown = "ctrl+down";
      selectSingle = "s";
      selectUp = "ctrl+up";
      togglePin = "p";
      togglePinned = "tab";
      up = "up";
      yankFilter = "ctrl+s";
    };

    imageDisplay = {
      type = "basic";
      scaleX = 9;
      scaleY = 9;
      heightCut = 2;
    };

    theme = {
      useCustomTheme = true;
      TitleFore = "#${color.base0E-hex}";
      NormalTitle = "#${color.base00-hex}";
      SelectedTitle = "#${color.base08-hex}";
      SelectedDesc = "#${color.base12-hex}";
      SelectedDescBorder = "#${color.base0C-hex}";
      PageActiveDot = "#${color.base0C-hex}";
      DividerDot = "#${color.base0C-hex}";
      StatusMsg = "#${color.base0B-hex}";
      PinIndicatorColor = "#${color.base0A-hex}";
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
