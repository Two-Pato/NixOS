{
  flake.nixosModules.kaede-network = {
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
        Address = [ "10.0.20.22/24" ];
        DNS = [ "10.0.20.1" ];
        Gateway = "10.0.20.1";
      };
    };

    networking.hostName = "kaede";
    networking.useNetworkd = true;

    networking.firewall = {
      enable = true;

      allowedTCPPorts = [
        80
        443
        5000 # Kavita
        8080 # Stirling
      ];
    };
  };
}
