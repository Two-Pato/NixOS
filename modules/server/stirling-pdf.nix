{ config, lib, pkgs, ... }:

{
  services.stirling-pdf = {
    enable = true;

    package = pkgs.stirling-pdf;

    environment = {
      SERVER_PORT = 8080;
    };
  };
}
