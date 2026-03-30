{ inputs, config, ... }: {
  flake.nixosConfigurations.mihari = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.mihari
      config.flake.nixosModules.desktop
      ../../../var/environment.nix
      ../../../var/shell.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = {
          imports = [
            ../../../hosts/mihari/home.nix
            inputs.stylix.homeModules.stylix
            inputs.nvf.homeManagerModules.default
          ];
        };
      }
    ];
  };
}
