{
  flake.nixosModules.desktop-settings = { pkgs, ... }: {
    hardware.logitech.wireless = {
      enable = true;
    };

    programs.openlogi = {
      enable = true;
    };
  };
}
