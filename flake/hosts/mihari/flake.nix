{ inputs, config, ... }: {
  flake.nixosConfigurations.mihari = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.mihari
      config.flake.nixosModules.desktop
      config.flake.nixosModules.core
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = {
          imports = [
            config.flake.homeModules.mihari
            config.flake.homeModules.cli
            config.flake.homeModules.nixos-core
            config.flake.homeModules.nixos-base
            config.flake.homeModules.nixos-extra
            config.flake.homeModules.nixos-desktop
            inputs.stylix.homeModules.stylix
            inputs.nvf.homeManagerModules.default
          ];
        };
      }
    ];
  };
}
