{ config, lib, pkgs, ... }:

{
  services.clipse = {
    enable = true;

    # Custom theme colors
    theme = {
      FilteredMatch = "#fbf9f8";
      NormalDesc = "#fbf9f8";
      NormalTitle = "#fbf9f8";
      SelectedDesc = "#f0acb7";
      SelectedTitle = "#f0acb7";
      SelectedDescBorder = "#f0acb7";
      TitleFore = "#c9a0ca";
      StatusMsg = "#6bc7de";
      PinIndicatorColor = "#fbf9f8";
    };

    # Clipboard history options
    allowDuplicates = false;
    historySize = 100;
    historyFile = "clipboard_history.json";
    logFile = "clipse.log";
    themeFile = "custom_theme.json";
    tempDir = "tmp_files";

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
