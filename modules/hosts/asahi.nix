{ config, inputs, ... }:
{
  flake.nixosConfigurations.asahi = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      asahi
      asahi-hardware
      asahi-network

      boot-grub
      core-settings
      nixos-server-asahi
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
