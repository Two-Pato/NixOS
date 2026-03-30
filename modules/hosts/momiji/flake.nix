{ inputs, config, ... }: {
  flake.darwinConfigurations.momiji = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      config.flake.darwinModules.momiji
      config.flake.darwinModules.desktop
      config.flake.darwinModules.core
      config.flake.darwinModules.macos
      config.flake.darwinModules.home-manager
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
