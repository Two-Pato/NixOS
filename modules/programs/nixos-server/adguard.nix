{
  flake.nixosModules.nixos-server-asahi = { pkgs, ... }: {
    services.adguardhome = {
      enable = true;

      package = pkgs.adguardhome;

      openFirewall = true;
    };
  };
}
