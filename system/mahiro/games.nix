{ config, lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = [ (pkgs.bottles.override { removeWarningPopup = true; }) ];
}
