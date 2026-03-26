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

    # NixOS
    ../../modules/nixos/bash.nix
    ../../modules/nixos/btop.nix
    ../../modules/nixos/yazi.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/home/laurent";

  # Packages
  programs.home-manager.enable = true;

  # Home Version
  home.stateVersion = "25.05";
}
