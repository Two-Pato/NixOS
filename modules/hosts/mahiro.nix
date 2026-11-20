{ config, inputs, ... }:
{
  flake.nixosConfigurations.mahiro = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mahiro
      mahiro-hardware
      mahiro-network

      core-settings
      desktop-nvidia
      desktop-settings
      games
      nixos-base

      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
    ];
  };

  flake.nixosModules.mahiro = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      mahiro

      bash
      cli
      core-settings
      nixos-base
      nixos-desktop

      inputs.nvf.homeModules.default
      inputs.stylix.homeModules.stylix
    ];

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      curl
      tray-tui
      usbutils
      wget
    ];
  };

  flake.homeModules.mahiro = { pkgs, ... }: {
    home.packages = with pkgs; [
      discord
      ncdu
    ];
  };
}
