{
  flake.homeModules.momiji = { config, lib, pkgs, ... }: {
    imports = [
      # MacOS
      ../../../modules/macos/zsh.nix
    ];

    home.username = "laurent";
    home.homeDirectory = "/Users/laurent";

    # Packages
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      ncdu
      tinymist
      typst
    ];

    # Home Version
    home.stateVersion = "25.05";
  };
}
