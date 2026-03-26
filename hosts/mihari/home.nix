{ config, lib, pkgs, ... }:

{
  imports = [
    # Cli
    ../../modules/cli/bat.nix
    ../../modules/cli/eza.nix
    ../../modules/cli/fastfetch.nix
    ../../modules/cli/fd.nix
    ../../modules/cli/git.nix
    ../../modules/cli/lazygit.nix
    ../../modules/cli/ripgrep.nix
    ../../modules/cli/starship.nix
    ../../modules/cli/television.nix

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
    ../../modules/desktop/xdg.nix

    # NixOS
    ../../modules/nixos/bash.nix
    ../../modules/nixos/btop.nix
    ../../modules/nixos/firefox.nix
    ../../modules/nixos/gthumb.nix
    ../../modules/nixos/kitty.nix
    ../../modules/nixos/nautilus.nix
    ../../modules/nixos/neovim.nix
    ../../modules/nixos/texteditor.nix
    ../../modules/nixos/yazi.nix

    # Extra
    ../../modules/nixos-extra/mpv.nix
    ../../modules/nixos-extra/vscode.nix
    ../../modules/nixos-extra/yt-dlp.nix
    ../../modules/nixos-extra/zathura.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    handbrake
    imagemagick
    mkvtoolnix
    ncdu
    parsec-bin
    solaar
    tinymist
    typst
    upscayl
  ];

  # Home Version
  home.stateVersion = "25.05";
}
