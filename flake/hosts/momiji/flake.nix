{ inputs, ... }: {
  flake.darwinConfigurations.momiji = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      config.flake.darwinModules.momiji
      ../../../var/shell.nix
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = import ../../../hosts/momiji/home.nix;
      }
    ];
  };
}
