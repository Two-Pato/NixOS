{ inputs, config, ... }: {
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.kaede
      config.flake.nixosModules.core
      config.flake.nixosModules.boot-grub
      config.flake.nixosModules.nixos-server-kaede
      config.flake.nixosModules.home-manager
    ];
  };

  flake.nixosModules.kaede = { pkgs, ... }: {
    home-manager.users.laurent.imports = [
      config.flake.homeModules.kaede
      config.flake.homeModules.core
      config.flake.homeModules.cli
      config.flake.homeModules.nixos-core
    ];

    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
