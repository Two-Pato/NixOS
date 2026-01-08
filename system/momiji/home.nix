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

    # MacOS
    ../../modules/macos/zsh.nix
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
