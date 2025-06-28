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

      search() {
          local query="$*"
          local GREP_CMD="grep -i --color=always -n -r"

          fzf --ansi \
              --query="$query" \
              --delimiter=":" \
              --preview='cat {1}' \
              --bind "change:reload:$GREP_CMD {q} ./" \
              --bind "start:reload:$GREP_CMD {q} ./" \
              --bind "enter:become(nano +{2} {1})"
      }
    '';
  };
}
