{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix
    ./games.nix
    ./networking.nix

    # Core
    ../../settings/core/filesystems.nix
    ../../settings/core/locale.nix
    ../../settings/core/nix.nix
    ../../settings/core/user.nix

    # Desktop
    ../../settings/desktop/audio.nix
    ../../settings/desktop/desktop-environment.nix
    ../../settings/desktop/fonts.nix
    ../../settings/desktop/login.nix
    ../../settings/desktop/polkit.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hardware Configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.logitech.wireless.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  # Services
  services.blueman.enable = true;
  services.gvfs.enable = true;
  services.openssh.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    curl
    tray-tui
    usbutils
    wget
  ];

  # System Version
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
