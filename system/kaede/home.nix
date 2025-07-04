{ config, lib, pkgs, ... }:

{
  imports = [
    # Default
    ../../modules/nixos-default/bash.nix
    ../../modules/nixos-default/btop.nix
    ../../modules/nixos-default/lazygit.nix
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

  ];

  # Home Version
  home.stateVersion = "25.05";
}
