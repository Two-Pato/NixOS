{ inputs, ... }:
{
  flake.nixosModules.core-settings = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager.backupFileExtension = "backup";
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
  };

  flake.darwinModules.core-settings = {
    imports = [ inputs.home-manager.darwinModules.home-manager ];

    home-manager.backupFileExtension = "backup";
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
  };

  flake.homeModules.core-settings = { osConfig, ... }: {
    programs.home-manager.enable = true;

    home.homeDirectory = if osConfig.nixpkgs.hostPlatform.isDarwin then "/Users/laurent" else "/home/laurent";
    home.username = "laurent";
  };
}
