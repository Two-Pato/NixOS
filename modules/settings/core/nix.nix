{
  flake.nixosModules.core-settings = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.download-buffer-size = 500000000; # 500 MB
    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };

  flake.darwinModules.core-settings = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.download-buffer-size = 500000000; # 500 MB
    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };
}
