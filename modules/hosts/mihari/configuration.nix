{
  flake.nixosModules.mihari = { config, pkgs, ... }: {

    home-manager.users.laurent.imports = [
      config.flake.homeModules.mihari
      config.flake.homeModules.cli
      config.flake.homeModules.core
      config.flake.homeModules.nixos-core
      config.flake.homeModules.nixos-base
      config.flake.homeModules.nixos-extra
      config.flake.homeModules.nixos-desktop
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
}
