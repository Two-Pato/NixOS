{ config, lib, pkgs, ... }:

{
  imports = [

  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [

  ];

  # Home Version
  home.stateVersion = "25.05";
}
