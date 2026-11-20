{
  flake.nixosModules.desktop-settings = {
    hardware.bluetooth = {
      enable = true;

      powerOnBoot = true;
    };

    services.blueman.enable = true;
  };
}
