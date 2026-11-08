{
  flake.nixosModules.desktop-nvidia = {
    hardware.graphics.enable = true;

    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
