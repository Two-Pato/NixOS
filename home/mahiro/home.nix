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
  
    # Programs Default
    ../../modules/bash.nix
    ../../modules/btop.nix
    ../../modules/fastfetch.nix
    ../../modules/firefox.nix
    ../../modules/fzf.nix
    ../../modules/git.nix
    ../../modules/gthumb.nix
    ../../modules/kitty.nix
    ../../modules/lazygit.nix
    ../../modules/nautilus.nix
    ../../modules/ripgrep.nix
    ../../modules/starship.nix
    ../../modules/texteditor.nix
    ../../modules/yazi.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    blueman
    discord
    ncdu
    solaar
  ];

  # Home Version
  home.stateVersion = "25.05";
}
