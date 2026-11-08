{
  flake.nixosModules.asahi-network = {
    systemd.network.enable = true;

    systemd.network.networks."10-wan" = {
      linkConfig = {
        RequiredForOnline = "routable";
      };

      matchConfig = {
        Name = [
          "en*"
          "eth*"
        ];
      };

      networkConfig = {
        Address = [ "10.0.20.21/24" ];
        DNS = [ "10.0.20.1" ];
        Gateway = "10.0.20.1";
      };
    };

    services.resolved = {
      enable = true;

      settings.Resolve = {
        DNSStubListener = false;
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

      allowedUDPPorts = [
        53 # DNS server
      ];
    };
  };
}
