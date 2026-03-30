{ inputs, config, ... }: {
  flake.nixosConfigurations.mahiro = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.mahiro
      config.flake.nixosModules.desktop
      config.flake.nixosModules.nvidia
      config.flake.nixosModules.core
      config.flake.nixosModules.nixos-base
      config.flake.nixosModules.games
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = {
          imports = [
            config.flake.homeModules.mahiro
            config.flake.homeModules.cli
            config.flake.homeModules.nixos-core
            config.flake.homeModules.nixos-base
            config.flake.homeModules.nixos-desktop
            inputs.stylix.homeModules.stylix
            inputs.nvf.homeManagerModules.default
          ];
        };
      }
    ];
  };
}
