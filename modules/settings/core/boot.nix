{
  flake.nixosModules.core-settings = {
    boot.initrd.systemd.enable = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
