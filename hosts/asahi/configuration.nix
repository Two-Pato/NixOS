{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    # Core
    ../../settings/core/locale.nix
    ../../settings/core/nix.nix
    ../../settings/core/ssh.nix
    ../../settings/core/user.nix

    # Server
    ../../modules/server/adguard.nix
  ];

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Packages
  environment.systemPackages = with pkgs; [
    curl
    wget
  ];

  # System Version
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
