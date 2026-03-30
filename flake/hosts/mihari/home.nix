{
  flake.homeModules.mihari = { config, lib, pkgs, ... }: {
    imports = [
      # Desktop
      ../../../modules/desktop/hyprland.nix
      ../../../modules/desktop/hyprlock.nix
      ../../../modules/desktop/hyprpaper.nix
    ];

    home.username = "laurent";
    home.homeDirectory = "/home/laurent";

    programs.home-manager.enable = true;

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

    home.stateVersion = "25.05";
  };
}
