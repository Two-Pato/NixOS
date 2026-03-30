{ inputs, config, ... }: {
  flake.nixosConfigurations.mihari = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.mihari
      config.flake.nixosModules.desktop
      config.flake.nixosModules.core
      config.flake.nixosModules.nixos-base
      config.flake.nixosModules.boot-efi
      config.flake.nixosModules.home-manager
    ];
  };
}
