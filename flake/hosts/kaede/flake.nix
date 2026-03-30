{ inputs, config, ... }: {
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.kaede
      config.flake.nixosModules.core
      ../../../var/shell.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = import config.flake.homeModules.kaede;
      }
    ];
  };
}
