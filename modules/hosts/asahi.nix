{ inputs, config, ... }: {
  flake.nixosConfigurations.asahi = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      asahi
      asahi-hardware
      asahi-network
      boot-grub
      core
      nixos-server-asahi
    ];
  };

  flake.nixosModules.asahi = { pkgs, ... }: {
    home-manager.users.laurent.imports = [
      config.flake.homeModules.asahi
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
