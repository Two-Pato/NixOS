{ config, lib, pkgs, ... }:

{
  services.uptime-kuma = {
    enable = true;

    package = pkgs.uptime-kuma;

    settings = {
      PORT = "3001";
    };
  };
}
