{ config, lib, pkgs, ... }:

{
  imports = [
    # Desktop
    ../../modules/hyprland.nix
    ../../modules/hyprpaper.nix
    ../../modules/hyprlock.nix
    ../../modules/hypridle.nix
    ../../modules/waybar.nix
    ../../modules/dunst.nix
    ../../modules/wlogout.nix
    ../../modules/rofi.nix
    ../../modules/clipse.nix

    # Programs
    ../../modules/bash.nix
    ../../modules/git.nix
    ../../modules/kitty.nix
    ../../modules/fastfetch.nix
    ../../modules/firefox.nix
    ../../modules/nautilus.nix
    ../../modules/texteditor.nix
    ../../modules/gthumb.nix
    ../../modules/yt-dlp.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    blueman
    solaar
    imagemagick
    mpv
    vscode
    #parsec-bin
  ];

  # Home Version
  home.stateVersion = "25.05";
}
