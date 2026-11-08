{ config, inputs, ... }:
{
  flake.darwinConfigurations.momiji = inputs.nix-darwin.lib.darwinSystem {
    modules = with config.flake.darwinModules; [
      momiji
      momiji-network

      core-settings
      desktop-settings
      macos
    ];
  };

  flake.darwinModules.momiji = { ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      momiji

      cli
      core-settings
      zsh
    ];
  };

  flake.homeModules.momiji = { pkgs, ... }: {
    home.packages = with pkgs; [
      ncdu
      tinymist
      typst
    ];
  };
}
