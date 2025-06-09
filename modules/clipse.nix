{ config, lib, pkgs, ... }:

{
  services.clipse = {
    enable = true;

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
