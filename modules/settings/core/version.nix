{
  flake.nixosModules.core = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.05";
  };

  flake.darwinModules.core = {
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;
  };
}
