{ inputs, config, ... }: {
  flake.nixosConfigurations.miyo = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      miyo
      miyo-hardware
      miyo-network
      boot-grub
      core-settings
      desktop-nvidia
      nixos-server-miyo
    ];
  };

  flake.nixosModules.miyo = { pkgs, ... }: {
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
