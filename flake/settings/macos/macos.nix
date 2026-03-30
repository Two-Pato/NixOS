{
  flake.darwinModules.macos = {
    system.defaults = {
      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
      };

      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
      };

      trackpad = {
        Clicking = true;
        TrackpadCornerSecondaryClick = 2;
      };

      WindowManager = {
        StandardHideWidgets = true;
      };

      dock = {
        autohide = false;
        show-recents = false;
        wvous-bl-corner = 2;
        wvous-br-corner = 4;
        mru-spaces = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        NewWindowTarget = "Home";
        ShowPathbar = true;
        _FXSortFoldersFirst = true;
      };
    };
  };
}