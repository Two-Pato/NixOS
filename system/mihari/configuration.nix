{ config, pkgs, ... }:

{
  # Imports and Nix Settings
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;

  # System Identity & Locale
  networking.hostName = "mihari";

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
  security.polkit.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking & Firewall
  systemd.network.enable = true;
  networking.useNetworkd = true;

  networking.firewall.enable = true;

  systemd.network.networks."10-wan" = {
    matchConfig = {
      Name = [ "en*" "eth*" ];
    };

    linkConfig = {
      RequiredForOnline = "routable";
    };

    networkConfig = {
      Address = [ "10.0.10.11/24" ];
      Gateway = "10.0.10.1";
      DNS = [ "10.0.10.1" ];
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
  services.gvfs.enable = true;

  # PipeWire audio configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Hardware Configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.logitech.wireless.enable = true;

  # Desktop Environment / Window Manager
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Login manager
   services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --user-menu --remember --cmd hyprland --remember-user-session --asterisks";
        user = "greeter";
      };
    };
  };

  # Utilities / Programs
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  # Systemd User Services
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  # Packages and Fonts
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    cifs-utils
    curl
    polkit_gnome
    usbutils
    wget
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  # Home manger
  home-manager.extraSpecialArgs = {
    inherit (config.networking) hostName;
  };

  # System Version
  system.stateVersion = "25.05";
}
