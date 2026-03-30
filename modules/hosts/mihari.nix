{ inputs, config, ... }: {
  flake.nixosConfigurations.mihari = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mihari
      mihari-hardware
      mihari-network
      boot-efi
      core
      desktop
      nixos-base
    ];
  };

  flake.nixosModules.mihari = { pkgs, ... }: {
    home-manager.users.laurent.imports = [
      config.flake.homeModules.mihari

      config.flake.homeModules.cli
      config.flake.homeModules.core
      config.flake.homeModules.nixos-core
      config.flake.homeModules.nixos-base
      config.flake.homeModules.nixos-extra
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

  flake.homeModules.mihari = { pkgs, ... }: {
    home.packages = with pkgs; [
      handbrake
      imagemagick
      mkvtoolnix
      ncdu
      parsec-bin
      solaar
      tinymist
      typst
      upscayl
    ];
  };
}
