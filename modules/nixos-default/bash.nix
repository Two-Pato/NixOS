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
      "cds"
      "clear"
      "exit"
    ];

    bashrcExtra = ''
      cds() {
        cd "$@" && ls
      }

      search() (
        RELOAD='reload:rg --column --color=always --smart-case {q} || :'
        OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
                  nano +{2} {1}
                else
                  nano {+f}
                fi'
        fzf --disabled --ansi --multi \
            --bind "start:$RELOAD" --bind "change:$RELOAD" \
            --bind "enter:become:$OPENER" \
            --bind "ctrl-o:execute:$OPENER" \
            --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
            --delimiter : \
            --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
            --preview-window '~4,+{2}+4/3,<80(up)' \
            --query "$*"
      )
    '';
  };
}
