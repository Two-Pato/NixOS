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
      Address = [ "10.0.20.21/24" ];
      Gateway = "10.0.20.1";
      DNS = [ "10.0.20.1" ];
    };
  };

  networking.hostName = "asahi";
  networking.useNetworkd = true;
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 
      80
      443
    ];
  };
}
