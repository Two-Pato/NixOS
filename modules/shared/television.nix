{ config, lib, pkgs, ... }:

{
  programs.television = {
    enable = true;

    settings.ui = {
      input_bar_position = "bottom";
    }
  };
}
