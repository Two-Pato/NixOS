{ config, lib, pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    config = {
      # General
      keep-open = true;
      
      # Audio
      volume = 100;
      volume-max = 150;
    };
  };
}
