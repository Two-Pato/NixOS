{ inputs, ... }: {
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      ../hosts/kaede/configuration.nix
      ../var/shell.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        home-manager.users.laurent = import ../hosts/kaede/home.nix;
      }
    ];
  };
}