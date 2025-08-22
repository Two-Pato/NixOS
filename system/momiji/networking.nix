{ config, pkgs, ... }:

{
  networking.hostName = "momiji";

  home-manager.extraSpecialArgs = {
    inherit (config.networking) hostName;
  };
}
