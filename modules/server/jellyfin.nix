{ config, lib, pkgs, ... }:

{
  services.jellyfin = {
    enable = true;

    package = pkgs.jellyfin;

    openFirewall = true;
  };
}
