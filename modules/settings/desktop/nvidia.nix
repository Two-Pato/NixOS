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

  flake.nixosModules.cuda = {
    config = {
      nixpkgs.config = {
        cudaSupport = true;
      };

      nix.settings = {
        extra-substituters = [ "https://cache.nixos-cuda.org" ];
        extra-trusted-public-keys = [ "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M=" ];
      };
    };
  };
}
