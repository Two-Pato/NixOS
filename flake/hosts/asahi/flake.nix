{ inputs, config, ... }: {
  flake.nixosConfigurations.asahi = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.asahi
      ../../../var/shell.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = import ../../../hosts/asahi/home.nix;
      }
    ];
  };
}
