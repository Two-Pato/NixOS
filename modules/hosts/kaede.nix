{ config, inputs, ... }:
{
  flake.nixosConfigurations.kaede = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      kaede
      kaede-hardware
      kaede-network

      core-settings
      nixos-server-kaede

      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
    ];
  };

  flake.nixosModules.kaede = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      bash
      cli
      core-settings
    ];

    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
