{ config, inputs, ... }:
{
  flake.nixosConfigurations.asahi = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      asahi
      asahi-hardware
      asahi-network

      core-settings
      nixos-server-asahi

      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
    ];
  };

  flake.nixosModules.asahi = { pkgs, ... }: {
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
