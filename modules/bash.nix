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
          local RG_CMD="rg -i --color=always --line-number --no-heading"

          fzf --ansi \
              --query="" \
              --delimiter=":" \
              --preview='cat {1} | head -100' \
              --bind "change:reload:$RG_CMD {q} || true" \
              --bind "start:reload:$RG_CMD {q} || true" \
              --bind "enter:become(nano +{2} {1})"
      }
    '';
  };
}
