{
  flake.nixosModules.kaede = { config, pkgs, ... }: {
    imports = [
      ../../../hosts/kaede/hardware-configuration.nix
      ../../../hosts/kaede/networking.nix
      # Core
      ../../../settings/core/filesystems.nix
      ../../../settings/core/locale.nix
      ../../../settings/core/nix.nix
      ../../../settings/core/ssh.nix
      ../../../settings/core/user.nix
      # Server
      ../../../modules/server/caddy.nix
      ../../../modules/server/jellyfin.nix
      ../../../modules/server/kavita.nix
      ../../../modules/server/stirling-pdf.nix
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;

    environment.systemPackages = with pkgs; [
      curl
      wget
    ];

    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.05";
  };
}
