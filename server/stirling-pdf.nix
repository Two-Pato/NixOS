{ config, lib, pkgs, ... }:

{
  services.stirling-pdf = {
    enable = true;

    package = pkgs.stirling-pdf;

    settings = {
      SERVER_PORT = 8080;
    };
  };
}