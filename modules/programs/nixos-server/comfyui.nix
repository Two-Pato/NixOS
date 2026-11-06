{
  flake.nixosModules.nixos-server-miyo = { pkgs, ... }: {
    services.comfyui = {
      enable = true;

      package = pkgs.comfyui;
    };
  };
}
