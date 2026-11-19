{ config, inputs, ... }:
{
  flake.nixosConfigurations.mihari = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mihari
      mihari-hardware
      mihari-network

      core-settings
      desktop-settings
      nixos-base

      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
    ];
  };

  flake.nixosModules.mihari = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      mihari

      bash
      cli
      core-settings
      nixos-base
      nixos-desktop
      nixos-extra

      inputs.nvf.homeManagerModules.default
      inputs.stylix.homeModules.stylix
    ];

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      curl
      nixd
      nixfmt
      tray-tui
      usbutils
      wget
    ];
  };

  flake.homeModules.mihari = { pkgs, ... }: {
    home.packages = with pkgs; [
      handbrake
      imagemagick
      mkvtoolnix
      ncdu
      pinta
      tinymist
      typst
      unzip
      upscayl
    ];
  };
}
