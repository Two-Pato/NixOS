{
  flake.nixosModules.core-settings = {
    nix.settings = {
      download-buffer-size = 500000000; # 500 MB
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      use-xdg-base-directories = true;
    };

    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };

  flake.darwinModules.core-settings = {
    nix.settings = {
      download-buffer-size = 500000000; # 500 MB
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };
}
