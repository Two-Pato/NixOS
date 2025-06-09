{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/bash.nix
    ../../modules/git.nix
  ];

  home.username = "laurent";
  home.homeDirectory = lib.mkDefault "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [

  ];

  # Home Version
  home.stateVersion = "25.05";
}
