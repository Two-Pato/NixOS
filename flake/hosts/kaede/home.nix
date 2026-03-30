{
  flake.homeModules.kaede = { config, lib, pkgs, ... }: {
    home.username = "laurent";
    home.homeDirectory = "/home/laurent";

    # Packages
    programs.home-manager.enable = true;

    # Home Version
    home.stateVersion = "25.05";
  };
}
