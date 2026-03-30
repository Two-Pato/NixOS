{ inputs, config, ... }: {
  flake.nixosConfigurations.mahiro = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mahiro
      mahiro-hardware
      mahiro-network
      boot-efi
      core
      desktop
      nvidia
      nixos-base
      games
    ];
  };

  flake.nixosModules.mahiro = { pkgs, ... }: {
    home-manager.users.laurent.imports = [
      config.flake.homeModules.mahiro
      config.flake.homeModules.cli
      config.flake.homeModules.core
      config.flake.homeModules.nixos-core
      config.flake.homeModules.nixos-base
      config.flake.homeModules.nixos-desktop
      config.flake.homeModules.home-manager
      inputs.stylix.homeModules.stylix
      inputs.nvf.homeManagerModules.default
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
