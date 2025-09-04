{ config, lib, pkgs, ... }:

{
  system.defaults = {
    CustomUserPreferences = {
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };
    };

    dock = {
      autohide = false;
      show-recents = false;
    };

    #finder = {
    #  AppleShowAllExtensions = true;
    #  FXPreferredViewStyle = "Nlsv";
    #};
  };
}
