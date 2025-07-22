{ config, lib, pkgs, ... }:

{
  imports = [
    # Core
    ../../modules/core/bat.nix
    ../../modules/core/eza.nix
    ../../modules/core/fastfetch.nix
    ../../modules/core/fd.nix
    ../../modules/core/git.nix
    ../../modules/core/ripgrep.nix
    ../../modules/core/starship.nix
    ../../modules/core/television.nix

    # NixOS
    ../../modules/nixos/bash.nix
    ../../modules/nixos/btop.nix
    ../../modules/nixos/lazygit.nix
    ../../modules/nixos/yazi.nix
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
