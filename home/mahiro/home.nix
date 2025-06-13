{ config, lib, pkgs, ... }:

{
  imports = [
    # Desktop
    ../../modules/clipse.nix
    ../../modules/dunst.nix
    ../../modules/hypridle.nix
    ../../modules/hyprland.nix
    ../../modules/hyprlock.nix
    ../../modules/hyprpaper.nix
    ../../modules/rofi.nix
    ../../modules/stylix.nix
    ../../modules/waybar.nix
    ../../modules/wlogout.nix
  
    # Programs
    ../../modules/bash.nix
    ../../modules/btop.nix
    ../../modules/fastfetch.nix
    ../../modules/firefox.nix
    ../../modules/fzf.nix
    ../../modules/git.nix
    ../../modules/gthumb.nix
    ../../modules/kitty.nix
    ../../modules/nautilus.nix
    ../../modules/texteditor.nix
    ../../modules/yazi.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    blueman
    solaar
    ncdu
    #parsec-bin
  ];

  # Home Version
  home.stateVersion = "25.05";
}
