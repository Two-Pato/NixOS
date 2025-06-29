{ config, lib, pkgs, ... }:

{
  imports = [
    # Programs Default
    ../../modules/bat.nix
    ../../modules/fastfetch.nix
    ../../modules/fzf.nix
    ../../modules/ripgrep.nix
    ../../modules/starship.nix
    ../../modules/zsh.nix
  ];

  home.username = "laurent";
  home.homeDirectory = "/Users/laurent";

  # Packages
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    
  ];

  # Home Version
  home.stateVersion = "25.05";
}
