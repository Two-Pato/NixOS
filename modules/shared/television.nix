{ config, lib, pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      tick_rate = 50;
      ui = {
        input_bar_position = "bottom";
        use_nerd_font_icons = true;
        preview_panel.scrollbar = true;
      };

      keybindings = {
        select_next_entry = ["down" "ctrl-j"];
        select_prev_entry = ["up" "ctrl-k"];
        toggle_preview = ["ctrl-p"];
        toggle_remote_control = ["ctrl-r"];
        toggle_help = ["?"];
        confirm_selection = ["enter" "ctrl-y"];
      };
    };

    channels = {
      default.cable_channel = [
        {
          name = "bash-history";
          description = "A channel to select from your bash history";
          source_command = "sed '1!G;h;$!d' \${HISTFILE:-\${HOME}/.bash_history}";
        }
        {
          name = "zsh-history";
          description = "A channel to select from your zsh history";
          source_command = "sed '1!G;h;$!d' \${HISTFILE:-\${HOME}/.zsh_history} | cut -d\";\" -f 2-";
        }
      ];
    };
  };
}
