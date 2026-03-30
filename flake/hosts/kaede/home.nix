{
  flake.homeModules.kaede = { config, lib, pkgs, ... }: {
    imports = [
      # NixOS
      ../../../modules/nixos/bash.nix
      ../../../modules/nixos/btop.nix
      ../../../modules/nixos/yazi.nix
    ];

    home.username = "laurent";
    home.homeDirectory = "/home/laurent";

    # Packages
    programs.home-manager.enable = true;

    # Home Version
    home.stateVersion = "25.05";
  };
}
