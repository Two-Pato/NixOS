{
  flake.nixosModules.mahiro-network = {
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
        Address = [ "10.0.10.12/24" ];
        DNS = [ "10.0.10.1" ];
        Gateway = "10.0.10.1";
      };
    };

    networking.hostName = "mahiro";
    networking.useNetworkd = true;
    networking.firewall.enable = true;
  };
}
