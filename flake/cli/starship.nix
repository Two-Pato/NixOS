{ config, ... }: {
  flake.homeModules.cli = { ... }: {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      settings = {
        format = builtins.concatStringsSep "" [
          "[](fg:#${config.colors.base08-hex})"
          "$username"
          "[](fg:#${config.colors.base08-hex} bg:#${config.colors.base09-hex})"
          "$hostname"
          "[](fg:#${config.colors.base09-hex} bg:#${config.colors.base0B-hex})"
          "$directory"
          "[](fg:#${config.colors.base0B-hex} bg:#${config.colors.base0D-hex})"
          "$git_branch$git_status"
          "[ ](fg:#${config.colors.base0D-hex})"
          "$line_break$character"
        ];

        username = {
          disabled = false;
          show_always = true;
          format = "[ $user  ]($style)";
          style_user = "fg:#${config.colors.base06-hex} bg:#${config.colors.base08-hex}";
          style_root = "fg:#${config.colors.base06-hex} bg:#${config.colors.base08-hex}";
        };

        hostname = {
          disabled = false;
          ssh_only = false;
          ssh_symbol = "";
          format = "[ $hostname 󰟀 ]($style)";
          style = "fg:#${config.colors.base06-hex} bg:#${config.colors.base09-hex}";
        };

        directory = {
          disabled = false;
          truncation_length = 3;
          truncation_symbol = "…/";
          format = "[ $path ]($style)";
          style = "fg:#${config.colors.base06-hex} bg:#${config.colors.base0B-hex}";
        };

        git_branch = {
          disabled = false;
          symbol = "";
          format = "[ $symbol $branch ]($style)";
          style = "fg:#${config.colors.base06-hex} bg:#${config.colors.base0D-hex}";
        };

        git_status = {
          disabled = false;
          format = "[($all_status$ahead_behind)]($style)";
          style = "fg:#${config.colors.base06-hex} bg:#${config.colors.base0D-hex}";
        };

        line_break = {
          disabled = false;
        };

        character = {
          disabled = false;
          success_symbol = "[](bold fg:#${config.colors.base0B-hex})";
          error_symbol = "[](bold fg:#${config.colors.base08-hex})";
        };
      };
    };
  };
}
