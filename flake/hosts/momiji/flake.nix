{ inputs, config, ... }: {
  flake.darwinConfigurations.momiji = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      config.flake.darwinModules.momiji
      config.flake.darwinModules.desktop
      config.flake.darwinModules.core
      ../../../var/shell.nix
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = {
          imports = [
            config.flake.homeModules.momiji
            config.flake.homeModules.cli
          ];
        };
      }
    ];
  };
}
