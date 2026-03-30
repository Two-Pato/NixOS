{
  flake.homeModules.momiji = { config, lib, pkgs, ... }: {
    imports = [
      # Cli
      ../../../modules/cli/bat.nix
      ../../../modules/cli/eza.nix
      ../../../modules/cli/fastfetch.nix
      ../../../modules/cli/fd.nix
      ../../../modules/cli/git.nix
      ../../../modules/cli/lazygit.nix
      ../../../modules/cli/ripgrep.nix
      ../../../modules/cli/starship.nix
      ../../../modules/cli/television.nix

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
