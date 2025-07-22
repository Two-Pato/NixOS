{ config, lib, pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      tick_rate = 50;
      ui = {
        use_nerd_font_icons = true;
        ui_scale = 100;
        input_bar_position = "bottom";
        orientation = "landscape";

        features = {
          preview_panel = {
            enabled = true;
            visible = true;
          };
          help_panel = {
            enabled = true;
            visible = false;
          };
          status_bar = {
            enabled = true;
            visible = true;
          };
          remote_control = {
            enabled = true;
            visible = false;
          };
        };

        preview_panel = {
          size = 50;
          scrollbar = true;
        };

        remote_control = {
          show_channel_descriptions = true;
          sort_alphabetically = true;
        };
      };

      keybindings = {
        select_next_entry = [ "down" "ctrl-j" ];
        select_prev_entry = [ "up" "ctrl-k" ];
        #scroll_preview_half_page_down = ["pagedown" "mousescrolldown"];
        #scroll_preview_half_page_up = ["pageup" "mousescrollup"];
        toggle_preview = [ "ctrl-p" ];
        toggle_remote_control = [ "ctrl-r" ];
        toggle_help = [ "ctrl-h" "?" ];
        confirm_selection = [ "enter" "ctrl-y" ];
      };
    };

    channels = {
      default.cable_channel = [
        {
          name = "bash-history";
          description = "A channel to select from your bash history";
          requirements = [ "bash" ];
          source_command = "sed '1!G;h;$!d' \${HISTFILE:-\${HOME}/.bash_history}";
        }
        {
          name = "zsh-history";
          description = "A channel to select from your zsh history";
          requirements = [ "zsh" ];
          source_command = "sed '1!G;h;$!d' \${HISTFILE:-\${HOME}/.zsh_history} | cut -d\";\" -f 2-";
        }
      ];
    };
  };
}
