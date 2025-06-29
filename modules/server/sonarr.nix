{ config, lib, pkgs, ... }:

{
  services.sonarr = {
    enable = true;

    package = pkgs.sonarr;

    openFirewall = true;
  };
}
