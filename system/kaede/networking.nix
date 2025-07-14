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
      Address = [ "10.0.20.22/24" ];
      Gateway = "10.0.20.1";
      DNS = [ "10.0.20.1" ];
    };
  };

  networking.hostName = "kaede";
  networking.useNetworkd = true;
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 
      80 
      443
      #3001 # Kuma
      5000 # Kavita
      8080 # Stirling
    ];
  };
}
