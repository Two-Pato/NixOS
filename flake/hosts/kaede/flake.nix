{ inputs, config, ... }: {
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.kaede
      config.flake.nixosModules.core
      config.flake.nixosModules.nixos-server-kaede
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = {
          imports = [
            config.flake.homeModules.kaede
            config.flake.homeModules.cli
            config.flake.homeModules.nixos-core
          ];
        };
      }
    ];
  };
}
