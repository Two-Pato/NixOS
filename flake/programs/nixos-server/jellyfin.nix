{
  flake.nixosModules.nixos-server-kaede = { pkgs, ... }: {
    services.jellyfin = {
      enable = true;

      package = pkgs.jellyfin;

      openFirewall = true;
    };
  };
}
