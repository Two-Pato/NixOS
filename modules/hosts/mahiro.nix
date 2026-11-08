{ config, inputs, ... }:
{
  flake.nixosConfigurations.mahiro = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mahiro
      mahiro-hardware
      mahiro-network

      boot-efi
      core-settings
      desktop-nvidia
      desktop-settings
      games
      nixos-base
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

      inputs.nvf.homeManagerModules.default
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
      solaar
    ];
  };
}
