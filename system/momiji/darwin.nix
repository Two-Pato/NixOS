{ config, lib, pkgs, ... }:

{
  # Dock
  system.defaults.dock = {
    autohide = false;
    show-recents = false;
  };

  #Finder
  #system.defaults.finder = {
  #  AppleShowAllExtensions = true;
  #  FXPreferredViewStyle = "icnv";
  #};
}
