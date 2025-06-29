{ config, pkgs, ... }:

{
  # Imports and Nix Settings
  imports = [

  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.laurent = {
    home = "/Users/laurent";
    shell = pkgs.zsh;
  };

  # Packages and Fonts
  #environment.systemPackages = with pkgs; [

  #];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Home Manager
  #home-manager.extraSpecialArgs = {
  #  inherit (config.networking) hostName;
  #};

  # System Version
  system.stateVersion = 6;
}
