{ inputs, config, ... }: {
  flake.darwinConfigurations.momiji = inputs.nix-darwin.lib.darwinSystem {
    modules = with config.flake.darwinModules; [
      momiji
      momiji-network
      desktop-settings
      core-settings
      macos
    ];
  };

  flake.darwinModules.momiji = { pkgs, ... }: {
    home-manager.users.laurent.imports = with config.flake.homeModules; [
      momiji
      core
      cli
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
