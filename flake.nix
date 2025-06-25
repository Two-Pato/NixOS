{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }: {
    nixosConfigurations.mihari = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/mihari/configuration.nix
        ./var/environment.nix
        ./var/shell.nix

        stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./home/mihari/home.nix;
        }
      ];
    };

    nixosConfigurations.mahiro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/mahiro/configuration.nix
        ./var/environment-nvidia.nix
        ./var/shell.nix

        stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./home/mahiro/home.nix;
        }
      ];
    };

    nixosConfigurations.kaede = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/kaede/configuration.nix
        ./var/shell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./home/kaede/home.nix;
        }
      ];
    };
  };
}
