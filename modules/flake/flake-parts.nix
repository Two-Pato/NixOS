{ inputs, lib, ... }: {
  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

  options.flake.darwinModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
    default = {};
  };

  config.systems = [
    "x86_64-linux"
    "aarch64-darwin"
  ];
}
