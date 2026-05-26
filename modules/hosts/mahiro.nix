{ inputs, config, ... }: {
  flake.nixosConfigurations.mahiro = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mahiro
      mahiro-hardware
      mahiro-network
      boot-efi
      core-settings
      desktop-settings
      desktop-nvidia
      nixos-base
      games
    ];
  };

  flake.nixosModules.mahiro = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      mahiro
      core-settings
      cli
      bash
      nixos-base
      nixos-desktop
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
