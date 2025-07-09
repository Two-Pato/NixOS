{ config, lib, pkgs, ... }:

{
  imports = [
    # Desktop
    ../../modules/desktop/clipse.nix
    ../../modules/desktop/dunst.nix
    ../../modules/desktop/hypridle.nix
    ../../modules/desktop/hyprland.nix
    ../../modules/desktop/hyprlock.nix
    ../../modules/desktop/hyprpaper.nix
    ../../modules/desktop/rofi.nix
    ../../modules/desktop/stylix.nix
    ../../modules/desktop/waybar.nix
    ../../modules/desktop/wlogout.nix

    # Default
    ../../modules/nixos-default/bash.nix
    ../../modules/nixos-default/btop.nix
    ../../modules/nixos-default/firefox.nix
    ../../modules/nixos-default/gthumb.nix
    ../../modules/nixos-default/kitty.nix
    ../../modules/nixos-default/lazygit.nix
    ../../modules/nixos-default/nautilus.nix
    ../../modules/nixos-default/neovim.nix
    ../../modules/nixos-default/texteditor.nix
    ../../modules/nixos-default/yazi.nix

    # Shared
    ../../modules/shared/bat.nix
    ../../modules/shared/eza.nix
    ../../modules/shared/fastfetch.nix
    ../../modules/shared/fzf.nix
    ../../modules/shared/git.nix
    ../../modules/shared/ripgrep.nix
    ../../modules/shared/starship.nix
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
