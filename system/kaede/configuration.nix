{ config, pkgs, ... }:

{
  # Imports and Nix Settings
  imports = [
    ./hardware-configuration.nix
    ../../server/kavita.nix
    ../../server/jellyfin.nix
    ../../server/uptime-kuma.nix
    ../../server/stirling-pdf.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;

  # System Identity & Locale
  networking.hostName = "kaede";

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  console.keyMap = "de";

  # Users & Permissions
  users.users.laurent = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Allow sudo usage
    shell = pkgs.bash;
  };

  security.sudo.enable = true;

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Networking & Firewall
  systemd.network.enable = true;
  networking.useNetworkd = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 
      80 
      443
      5000 #Kavita
    ];
  };

  systemd.network.networks."10-wan" = {
    matchConfig = {
      Name = [ "en*" "eth*" ];
    };

    linkConfig = {
      RequiredForOnline = "routable";
    };

    networkConfig = {
      Address = [ "10.0.20.100/24" ];
      Gateway = "10.0.20.1";
      DNS = [ "10.0.20.1" ];
    };
  };

  # CIFS Mount
  fileSystems."/mnt/media" = {
    device = "//10.0.20.31/media";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/home/laurent/.secrets/credentials"
      "uid=1000"
      "gid=100"
    ];
  };

  # Services
  services.openssh.enable = true;

  # Packages and Fonts
  environment.systemPackages = with pkgs; [
    cifs-utils
    curl
    wget
  ];

  # System Version
  system.stateVersion = "25.05";
}
