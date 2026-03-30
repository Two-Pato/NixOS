{ inputs, ... }: {
  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };

  flake.darwinModules.home-manager = {
    imports = [ inputs.home-manager.darwinModules.home-manager ];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };

  flake.homeModules.home-manager = { osConfig, ... }: {
    programs.home-manager.enable = true;

    home.username = "laurent";
    home.homeDirectory = if osConfig.nixpkgs.hostPlatform.isDarwin
      then "/Users/laurent"
      else "/home/laurent";
  };
}
