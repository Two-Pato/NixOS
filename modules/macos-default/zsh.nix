{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;

    history = {
      ignoreAllDups = true;
    };
  };
}
