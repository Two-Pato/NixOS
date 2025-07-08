{ config, lib, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      window-padding-x = 10;
    };
  };
}
