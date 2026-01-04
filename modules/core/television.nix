{ config, lib, pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;

    settings = {
      tick_rate = 50;
      ui = {
        ui_scale = 100;
        orientation = "landscape";

        input_bar = {
          position = "bottom";
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
    };

    channels = {
      bash-history = {
        metadata = {
          name = "bash-history";
          description = "A channel to select from your bash history";
          requirements = [ "bash" ];
        };

        source = {
          command = "sed '1!G;h;$!d' \${HISTFILE:-\${HOME}/.bash_history}";
        };
      };

      zsh-history = {
        metadata = {
          name = "zsh-history";
          description = "A channel to select from your zsh history";
          requirements = [ "zsh" ];
        };

        source = {
          command = "sed '1!G;h;$!d' \${HISTFILE:-\${HOME}/.zsh_history}";
          display = "{split:;:1..}";
          output = "{split:;:1..}";
        };
      };

      dirs = {
        metadata = {
          name = "dirs";
          description = "A channel to select from directories";
          requirements = [ "fd" ];
        };

        source = {
          command = [ "fd -t d" "fd -t d --hidden" ];
        };

        preview = {
          command = "ls -la --color=always '{}'";
        };

        keybindings = {
          shortcut = "1";
        };
      };

      env = {
        metadata = {
          name = "env";
          description = "A channel to select from environment variables";
        };

        source = {
          command = "printenv";
          output = "{split:=:1..}";
        };

        preview = {
          command = "echo '{split:=:1..}'";
        };

        ui = {
          layout = "portrait";
          preview_panel = {
            size = 20;
            header = "{split:=:0}";
          };
        };

        keybindings = {
          shortcut = "4";
        };
      };

      files = {
        metadata = {
          name = "files";
          description = "A channel to select files and directories";
          requirements = [ "fd" "bat" ];
        };

        source = {
          command = ["fd -t f" "fd -t f -H"];
        };

        preview = {
          command = "bat -n --color=always '{}'";
          env = {
            BAT_THEME = "ansi";
          };
        };

        keybindings = {
          shortcut = "2";
          enter = "actions:edit";
        };

        actions.edit = {
          description = "Opens the selected entries with neovim";
          command = "nvim '{}'";
          mode = "execute";
        };
      };

      text = {
        metadata = {
          name = "text";
          description = "A channel to find and select text from files";
          requirements = [ "rg" "bat" ];
        };

        source = {
          command = "rg . --no-heading --line-number --colors 'match:fg:white' --colors 'path:fg:blue' --color=always";
          ansi = true;
          output = "{strip_ansi|split:\\::..2}";
        };

        preview = {
          command = "bat -n --color=always '{strip_ansi|split:\\::0}'";
          offset = "'{strip_ansi|split:\::1}'";
          env = {
            BAT_THEME = "ansi";
          };
        };

        ui = {
          preview_panel = {
            header = "{strip_ansi|split:\\::..2}";
          };
        };

        keybindings = {
          shortcut = "3";
        };
      };
    };
  };
}
