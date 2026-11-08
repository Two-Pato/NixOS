{
  flake.nixosModules.mihari-network = { pkgs, ... }: {
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
        Address = [ "10.0.10.11/24" ];
        DNS = [ "10.0.10.1" ];
        Gateway = "10.0.10.1";
      };
    };

    networking.hostName = "mihari";
    networking.useNetworkd = true;
    networking.firewall = {
      enable = true;
      checkReversePath = "loose";
    };

    environment.systemPackages = with pkgs; [
      wireguard-tools
    ];
  };
}
