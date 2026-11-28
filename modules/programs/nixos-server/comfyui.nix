{
  flake.nixosModules.nixos-server-miyo = { pkgs, ... }: {
    services.comfyui = {
      enable = true;

      package = pkgs.comfyui;

      listen = [
        "10.0.20.23" 
      ];
    };

    systemd.services.comfyui = {
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
    };
  };
}
