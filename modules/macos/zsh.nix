{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;

    history = {
      ignoreAllDups = true;
      ignorePatterns = [
        "ls"
        "la"
        "ll"
        "lt"
        "cd *"
        "clear"
        "exit"
      ];
    };
  };
}
