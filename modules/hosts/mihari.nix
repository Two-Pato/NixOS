{ inputs, config, ... }: {
  flake.nixosConfigurations.mihari = inputs.nixpkgs.lib.nixosSystem {
    modules = with config.flake.nixosModules; [
      mihari
      mihari-hardware
      mihari-network
      boot-efi
      core-settings
      desktop-settings
      nixos-base
    ];
  };

  flake.nixosModules.mihari = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      mihari
      core-settings
      cli
      bash
      nixos-base
      nixos-extra
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
