{ inputs, ... }: {
  flake.nixosModules.core-settings = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };

  flake.darwinModules.core-settings = {
    imports = [ inputs.home-manager.darwinModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };

  flake.homeModules.core-settings = { osConfig, ... }: {
    programs.home-manager.enable = true;

    home.username = "laurent";
    home.homeDirectory = if osConfig.nixpkgs.hostPlatform.isDarwin
      then "/Users/laurent"
      else "/home/laurent";
  };
}
