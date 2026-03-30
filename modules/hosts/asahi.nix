{ inputs, config, ... }: {
  flake.nixosConfigurations.asahi = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules.asahi
      config.flake.nixosModules.core
      config.flake.nixosModules.boot-grub
      config.flake.nixosModules.nixos-server-asahi
      config.flake.nixosModules.home-manager
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
