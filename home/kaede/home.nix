{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/bash.nix
    ../../modules/btop.nix
    ../../modules/fastfetch.nix
    ../../modules/fzf.nix
    ../../modules/git.nix
    ../../modules/lazygit.nix
    ../../modules/yazi.nix
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
