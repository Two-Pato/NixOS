{
  flake.homeModules.momiji = { config, lib, pkgs, ... }: {
    home.username = "laurent";
    home.homeDirectory = "/Users/laurent";

    # Packages
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      ncdu
      tinymist
      typst
    ];
  };
}
