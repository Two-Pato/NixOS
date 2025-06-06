{ config, pkgs, ... }:

{
  # Imports and Nix Settings
  imports = [
    ./hardware-configuration.nix
    ../../programs/systempackages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # System Identity & Locale
  networking.hostName = "mihari";

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "de_DE.UTF-8";
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
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # Services
  services.openssh.enable = true;
  services.gvfs.enable = true;

  # PipeWire audio configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true; # Uncomment if JACK support is needed
  };

  # Hardware Configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Desktop Environment / Window Manager
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Login manager
  programs.regreet.enable = true;

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
    git
    wget
    curl
    adwaita-icon-theme
    polkit_gnome
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  # System Version
  system.stateVersion = "24.05";
}
