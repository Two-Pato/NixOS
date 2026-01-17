{ config, pkgs, ... }:

{
  systemd.network.enable = true;

  systemd.network.networks."10-wan" = {
    matchConfig = {
      Name = [ "en*" "eth*" ];
    };

    linkConfig = {
      RequiredForOnline = "routable";
    };

    networkConfig = {
      Address = [ "10.0.10.12/24" ];
      Gateway = "10.0.10.1";
      DNS = [ "10.0.20.1" ];
    };
  };

  networking.hostName = "mahiro";
  networking.useNetworkd = true;
  networking.firewall.enable = true;

  home-manager.extraSpecialArgs = {
    inherit (config.networking) hostName;
  };
}
