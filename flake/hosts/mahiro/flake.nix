{ inputs, config, ... }: {
  flake.nixosConfigurations.mahiro = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.mahiro
      config.flake.nixosModules.desktop
      config.flake.nixosModules.nvidia
      config.flake.nixosModules.core
      ../../../var/environment.nix
      ../../../var/shell.nix
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
            inputs.stylix.homeModules.stylix
            inputs.nvf.homeManagerModules.default
          ];
        };
      }
    ];
  };
}
