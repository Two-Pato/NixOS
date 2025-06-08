{ config, lib, pkgs, ... }:

let
 color = import ../var/color.nix;
in
{
  services.clipse = {
    enable = true;

    # Custom theme colors
    theme = {
      FilteredMatch = "#${color.base06-hex}";
      NormalDesc = "#${color.base06-hex}";
      NormalTitle = "#${color.base06-hex}";
      SelectedDesc = "#${color.base08-hex}";
      SelectedTitle = "#${color.base08-hex}";
      SelectedDescBorder = "#${color.base08-hex}";
      TitleFore = "#${color.base0E-hex}";
      StatusMsg = "#${color.base0C-hex}";
      PinIndicatorColor = "#${color.base06-hex}";
    };

    # Clipboard history options
    allowDuplicates = false;
    historySize = 100;

    # Keybindings
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

    # Image display configuration
    imageDisplay = {
      type = "basic";
      scaleX = 9;
      scaleY = 9;
      heightCut = 2;
    };
  };
}
