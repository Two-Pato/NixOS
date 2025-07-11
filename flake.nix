{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

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

  outputs = { self, nixpkgs, nix-darwin, nix-homebrew, home-manager, stylix, nvf, ... }: {
    # NixOS
    nixosConfigurations.mihari = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/mihari/configuration.nix
        ./var/environment.nix
        ./var/shell.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = {
            imports = [
              ./system/mihari/home.nix
              stylix.homeModules.stylix
              nvf.homeManagerModules.default
            ];
          };
        }
      ];
    };

    nixosConfigurations.mahiro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./system/mahiro/configuration.nix
        ./var/environment-nvidia.nix
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
      system = "aarch64-darwin";
      modules = [
        ./system/momiji/configuration.nix
        ./var/shell.nix

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            user = laurent;
            enable = true;
            autoMigrate = true;
          };
        }

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.laurent = import ./system/momiji/home.nix;
        }
      ];
    };

    # Server
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
          home-manager.users.laurent = import ./system/kaede/home.nix;
        }
      ];
    };
  };
}
