{
  flake.nixosModules.core-settings = {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      download-buffer-size = 500000000; # 500 MB
      use-xdg-base-directories = true;
    };

    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };

  flake.darwinModules.core-settings = {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      download-buffer-size = 500000000; # 500 MB
    };

    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };
}
