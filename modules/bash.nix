{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    historyFile = "$HOME/.config/bash/bash_history";

    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
  };
}