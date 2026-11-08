{
  flake.nixosModules.miyo-network = {
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
        Address = [ "10.0.20.23/24" ];
        DNS = [ "10.0.20.1" ];
        Gateway = "10.0.20.1";
      };
    };

    networking.hostName = "miyo";
    networking.useNetworkd = true;

    networking.firewall = {
      enable = true;

      allowedTCPPorts = [
        80
        443
        8188 # ComfyUI
      ];
    };
  };
}
