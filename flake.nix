{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, stylix, nvf, ... }: {
    # NixOS
    nixosConfigurations.mihari = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/mihari/configuration.nix
        ./var/environment.nix
        ./var/shell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = {
            imports = [
              ./system/mihari/hosts.nix
              stylix.homeModules.stylix
              nvf.homeManagerModules.default
            ];
          };
        }
      ];
    };

    nixosConfigurations.mahiro = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/mahiro/configuration.nix
        ./var/environment.nix
        ./var/shell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = {
            imports = [
              ./system/mahiro/home.nix
              stylix.homeModules.stylix
              nvf.homeManagerModules.default
            ];
          };
        }
      ];
    };

    # MacOS
    darwinConfigurations.momiji = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/momiji/configuration.nix
        ./var/shell.nix

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./hosts/momiji/home.nix;
        }
      ];
    };

    # Server
    nixosConfigurations.kaede = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/kaede/configuration.nix
        ./var/shell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./hosts/kaede/home.nix;
        }
      ];
    };

    nixosConfigurations.asahi = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/asahi/configuration.nix
        ./var/shell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./hosts/asahi/home.nix;
        }
      ];
    };
  };
}
