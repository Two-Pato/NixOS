{ ... }: {
  flake.nixosModules.mihari = { config, pkgs, ... }: {
    imports = [
      ../../../hosts/mihari/hardware-configuration.nix
      ../../../hosts/mihari/networking.nix

      # Core
      ../../../settings/core/filesystems.nix
      ../../../settings/core/locale.nix
      ../../../settings/core/nix.nix
      ../../../settings/core/ssh.nix
      ../../../settings/core/user.nix

      # Desktop
      config.flake.nixosModules.audio
      ../../../settings/desktop/bluetooth.nix
      ../../../settings/desktop/desktop-environment.nix
      ../../../settings/desktop/fonts.nix
      ../../../settings/desktop/login.nix
      ../../../settings/desktop/polkit.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.gvfs.enable = true;

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      curl
      tray-tui
      usbutils
      wget
    ];

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.05";
  };
}
