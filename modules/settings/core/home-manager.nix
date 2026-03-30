{ inputs, ... }: {
  flake.nixosModules.core = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };

  flake.darwinModules.core = {
    imports = [ inputs.home-manager.darwinModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };

  flake.homeModules.core = { osConfig, ... }: {
    programs.home-manager.enable = true;

    home.username = "laurent";
    home.homeDirectory = if osConfig.nixpkgs.hostPlatform.isDarwin
      then "/Users/laurent"
      else "/home/laurent";
  };
}
