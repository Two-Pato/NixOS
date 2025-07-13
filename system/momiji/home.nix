{ config, lib, pkgs, ... }:

{
  imports = [
    # Default
    #../../modules/macos-default/ghostty.nix
    ../../modules/macos-default/zsh.nix

    # Shared
    ../../modules/shared/bat.nix
    ../../modules/shared/eza.nix
    ../../modules/shared/fastfetch.nix
    ../../modules/shared/fd.nix
    ../../modules/shared/git.nix
    ../../modules/shared/ripgrep.nix
    ../../modules/shared/starship.nix
    ../../modules/shared/television.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/Users/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    ncdu
  ];

  # Home Version
  home.stateVersion = "25.05";
}
