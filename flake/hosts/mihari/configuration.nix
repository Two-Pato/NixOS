{
  flake.nixosModules.mihari = { config, pkgs, ... }: {
    imports = [
      ../../../hosts/mihari/hardware-configuration.nix
      ../../../hosts/mihari/networking.nix

      # Core
      ../../../settings/core/filesystems.nix
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
