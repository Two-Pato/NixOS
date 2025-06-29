{ config, pkgs, ... }:

{
  # Imports and Nix Settings
  imports = [
    ./darwin.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Users and Permissions
  users.users.laurent = {
    home = "/Users/laurent";
    shell = pkgs.zsh;
  };

  system.primaryUser = "laurent";

  # Packages and Fonts
  environment.systemPackages = with pkgs; [

  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # System Version
  system.stateVersion = 6;
}
