{ inputs, config, ... }: {
  flake.darwinConfigurations.momiji = inputs.nix-darwin.lib.darwinSystem {
    modules = with config.flake.darwinModules; [
      momiji
      momiji-network
      desktop
      core
      macos
    ];
  };

  flake.darwinModules.momiji = { pkgs, ... }: {
    home-manager.users.laurent.imports = [
      config.flake.homeModules.momiji
      config.flake.homeModules.core
      config.flake.homeModules.cli
      config.flake.homeModules.macos-core
      config.flake.homeModules.home-manager
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
