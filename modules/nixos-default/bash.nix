{ config, lib, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];

    historyIgnore = [
      "ls"
      "la"
      "ll"
      "cd"
      "clear"
      "exit"
    ];
  };
}
