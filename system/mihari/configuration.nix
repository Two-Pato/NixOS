{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix
    ./networking.nix

    # Configuration
    ../../configuration/audio.nix
    ../../configuration/desktop.nix
    ../../configuration/filesystems.nix
    ../../configuration/fonts.nix
    ../../configuration/locale.nix
    ../../configuration/login.nix
    ../../configuration/polkit.nix
    ../../configuration/user.nix
  ];

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hardware Configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.logitech.wireless.enable = true;

  # Services
  services.openssh.enable = true;
  services.gvfs.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    cifs-utils
    curl
    polkit_gnome
    pwvucontrol
    tray-tui
    usbutils
    wget
  ];

  # System Version
  system.stateVersion = "25.05";
}
