{ config, lib, pkgs, ... }:

{
  services.adguardhome = {
    enable = true;

    package = pkgs.adguardhome;

    openFirewall = true;
  };
}