{ inputs, config, ... }: {
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      kaede
      kaede-hardware
      kaede-network
      boot-grub
      core
      nixos-server-kaede
    ];
  };

  flake.nixosModules.kaede = { pkgs, ... }: {
    home-manager.users.laurent.imports = [
      config.flake.homeModules.kaede
      config.flake.homeModules.core
      config.flake.homeModules.cli
      config.flake.homeModules.nixos-core
      config.flake.homeModules.home-manager
    ];

    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
