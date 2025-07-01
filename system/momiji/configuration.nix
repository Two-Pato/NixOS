{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./darwin.nix

    # Configuration
    ../../configuration/fonts.nix
  ];

  # Nix Settings
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

  # Packages
  environment.systemPackages = with pkgs; [

  ];

  # System Version
  system.stateVersion = 6;
}
