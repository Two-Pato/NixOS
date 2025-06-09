{ config, lib, pkgs, ... }:

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
  };
}
