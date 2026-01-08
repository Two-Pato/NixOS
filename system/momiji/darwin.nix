{ config, lib, pkgs, ... }:

{
  system.defaults = {
    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
    };

    NSGlobalDomain = {
      "com.apple.swipescrolldirection" = false;
    };

    trackpad = {
      Clicking = true;
      TrackpadCornerSecondaryClick = 2;
    };

    dock = {
      autohide = false;
      show-recents = false;

      wvous-bl-corner = 2;
      wvous-br-corner = 4;
    };

    WindowManager = {
      StandardHideWidgets = true;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Home";
      ShowPathbar = true;
      _FXSortFoldersFirst = true;
    };
  };
}
