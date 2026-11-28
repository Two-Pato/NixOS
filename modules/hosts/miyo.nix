{ config, inputs, ... }:
{
  flake.nixosConfigurations.miyo = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      miyo
      miyo-hardware
      miyo-network

      core-settings
      cuda
      desktop-nvidia
      nixos-server-miyo

      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
    ];
  };

  flake.nixosModules.miyo = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      bash
      cli
      core-settings
    ];

    environment.systemPackages = with pkgs; [
      curl
      ncdu
      wget
    ];
  };
}
