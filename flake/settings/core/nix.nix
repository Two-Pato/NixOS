{
  flake.nixosModules.core = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.download-buffer-size = 500000000; # 500 MB
    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };

  flake.darwinModules.core = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.download-buffer-size = 500000000; # 500 MB
    nix.optimise.automatic = true;
    nixpkgs.config.allowUnfree = true;
  };
}
