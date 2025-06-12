{ config, lib, pkgs, ... }:

{
  services.kavita = {
    enable = true;

    package = pkgs.kavita;

    settings = {
      Port = 5000;
    };

    tokenKeyFile = "/home/laurent/.secrets/token.key"; #head -c 64 /dev/urandom | base64 --wrap=0
  };
}
