{
  flake.homeModules.asahi = { config, lib, pkgs, ... }: {
    home.username = "laurent";
    home.homeDirectory = "/home/laurent";

    # Packages
    programs.home-manager.enable = true;
  };
}
