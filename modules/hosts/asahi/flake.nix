{ inputs, config, ... }: {
  flake.nixosConfigurations.asahi = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.asahi
      config.flake.nixosModules.core
      config.flake.nixosModules.boot-grub
      config.flake.nixosModules.nixos-server-asahi
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = {
          imports = [
            config.flake.homeModules.asahi
            config.flake.homeModules.core
            config.flake.homeModules.cli
            config.flake.homeModules.nixos-core
          ];
        };
      }
    ];
  };
}
