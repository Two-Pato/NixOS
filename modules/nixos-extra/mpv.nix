{ config, lib, pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    config = {
      # General
      keep-open = true;
      target-colorspace-hint = false;
      
      # Audio
      volume = 100;
      volume-max = 150;
    };

    bindings = {
      UP = "add volume 5";
      DOWN = "add volume -5";
    };
  };
}
