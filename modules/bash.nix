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
      "hs"
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
