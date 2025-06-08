{ config, lib, pkgs, ... }:

{
  imports = [
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
