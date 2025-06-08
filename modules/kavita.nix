{ config, lib, pkgs, ... }:

{
  services.kavita. = {
    enable = true;

    package = pkgs.kavita;

    user = "laurent";

    settings = {
      Port = 5000;
    };

  };
}
