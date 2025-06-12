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
      "cd"
      "cds"
      "clear"
      "exit"
    ];

    bashrcExtra = ''
      cds() {
        cd "$@" && ls
      }
    '';
  };
}
