{
  flake.nixosModules.core-settings = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "25.05";
  };

  flake.darwinModules.core-settings = {
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;
  };

  flake.homeModules.core-settings = {
    home.stateVersion = "25.05";
  };
}
