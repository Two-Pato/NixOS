{ config, lib, pkgs, ... }:

{
  system.defaults = {
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
