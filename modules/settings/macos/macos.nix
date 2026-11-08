{
  flake.darwinModules.macos = {
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

      WindowManager = {
        StandardHideWidgets = true;
      };

      dock = {
        autohide = false;
        mru-spaces = false;
        show-recents = false;
        wvous-bl-corner = 2;
        wvous-br-corner = 4;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        NewWindowTarget = "Home";
        ShowPathbar = true;
        _FXSortFoldersFirst = true;
      };

      trackpad = {
        Clicking = true;
        TrackpadCornerSecondaryClick = 2;
      };
    };
  };
}
