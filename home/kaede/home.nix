{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/bash.nix
    ../../modules/git.nix
    ../../modules/lazygit.nix
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
