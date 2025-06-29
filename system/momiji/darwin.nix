{ config, lib, pkgs, ... }:

{
  # Dock
  system.defaults.dock = {
    autohide = false;
  };

  #system.defaults.NSGlobalDomain = {
  #  AppleShowAllExtensions = true;
  #};

  #system.defaults.finder = {
  #  AppleShowAllExtensions = true;
  #  FXPreferredViewStyle = "icnv";
  #};
}
