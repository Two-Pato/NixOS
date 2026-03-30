{
  flake.nixosModules.asahi = { config, pkgs, ... }: {
    imports = [
      ../../../hosts/asahi/hardware-configuration.nix
      ../../../hosts/asahi/networking.nix
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
