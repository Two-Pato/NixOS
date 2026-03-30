{
  flake.nixosModules.kaede = { config, pkgs, ... }: {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;

    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
