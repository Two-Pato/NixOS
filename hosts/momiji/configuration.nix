{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./darwin.nix
    ./networking.nix

    # Core
    ../../settings/core/nix.nix

    # Desktop
    ../../settings/desktop/fonts.nix
  ];

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
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
}
