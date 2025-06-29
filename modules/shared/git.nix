{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Two-Pato";
    userEmail = "188864485+Two-Pato@users.noreply.github.com";
  };
}
