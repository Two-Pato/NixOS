{
  flake.homeModules.mahiro = { config, lib, pkgs, ... }: {
    imports = [
      # Desktop
      ../../../modules/desktop/hyprland.nix
      ../../../modules/desktop/hyprlock.nix
      ../../../modules/desktop/hyprpaper.nix
    ];

    home.username = "laurent";
    home.homeDirectory = "/home/laurent";

    # Packages
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      discord
      ncdu
      solaar
    ];

    # Home Version
    home.stateVersion = "25.05";
  };
}
