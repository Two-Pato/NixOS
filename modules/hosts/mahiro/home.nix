{
  flake.homeModules.mahiro = { config, lib, pkgs, ... }: {
    home.username = "laurent";
    home.homeDirectory = "/home/laurent";

    # Packages
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      discord
      ncdu
      solaar
    ];
  };
}
