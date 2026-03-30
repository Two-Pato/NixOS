{
  flake.nixosModules.asahi = { config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
