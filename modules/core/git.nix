{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings.user = {
        name = "Two-Pato";
        email = "188864485+Two-Pato@users.noreply.github.com";
    };
  };
}
