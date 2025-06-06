{ config, lib, pkgs, ... }:

{
  imports = [
    # Desktop
    ../../modules/hyprland.nix
    ../../modules/hyprpaper.nix
    ../../modules/hyprlock.nix
    ../../modules/waybar.nix
    ../../modules/dunst.nix
    ../../modules/wlogout.nix
    ../../modules/rofi.nix
    ../../modules/clipse.nix

    # Programs
    ../../modules/kitty.nix
    ../../modules/fastfetch.nix
    ../../modules/firefox.nix
    ../../modules/nautilus.nix
    ../../modules/texteditor.nix
    ../../modules/gthumb.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    blueman
    solaar
    imagemagick
    mpv
    yt-dlp
    vscode
    parsec-bin
  ];
}
