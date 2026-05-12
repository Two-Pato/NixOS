{
  flake.nixosModules.desktop-settings = {
    hardware.bluetooth = {
      enable = true;

      powerOnBoot = true;
    };

    hardware.logitech.wireless.enable = true;

    services.blueman.enable = true;
  };
}
