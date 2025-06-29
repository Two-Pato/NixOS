{ config, lib, pkgs, ... }:

{
  imports = [
    # Programs Default
    ../../modules/bat.nix
    ../../modules/fastfetch.nix
    ../../modules/fzf.nix
    ../../modules/ripgrep.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ncdu
  ];

  # Home Version
  home.stateVersion = "25.05";
}
