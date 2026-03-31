{ inputs, config, ... }: {
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      kaede
      kaede-hardware
      kaede-network
      boot-grub
      core-settings
      nixos-server-kaede
    ];
  };

  flake.nixosModules.kaede = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      core-settings
      cli
      bash
    ];

    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
