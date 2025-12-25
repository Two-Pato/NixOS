{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    # Configuration
    ../../configuration/locale.nix
    ../../configuration/user.nix

    # Server
    ../../modules/server/adguard.nix
  ];

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;
  nix.optimise.automatic = true;

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Services
  services.openssh.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    cifs-utils
    curl
    wget
  ];

  # System Version
  system.stateVersion = "25.05";
}
