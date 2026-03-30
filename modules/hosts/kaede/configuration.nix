{
  flake.nixosModules.kaede = { config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      curl
      wget
    ];
  };
}
