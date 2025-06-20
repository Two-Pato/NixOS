{ config, lib, pkgs, ... }:

let
  color = import ../var/color.nix;
in
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;

    settings = {

      format = builtins.concatStringsSep "" [
        "[](fg:#${color.base08-hex})"
        "$username"
        "[](fg:#${color.base08-hex} bg:#${color.base09-hex})"
        "$hostname"
        "[](fg:#${color.base09-hex} bg:#${color.base0B-hex})"
        "$directory"
        "[](fg:#${color.base0B-hex} bg:#${color.base0D-hex})"
        "$git_branch$git_status"
        "[ ](fg:#${color.base0D-hex})"
        "$line_break$character"
      ];

      username = {
        disabled = false;
        show_always = true;
        format = "[ $user  ]($style)";
        style_user = "fg:#${color.base06-hex} bg:#${color.base08-hex}";
        style_root = "fg:#${color.base06-hex} bg:#${color.base08-hex}";
      };

      hostname = {
        disabled = false;
        ssh_only = false;
        ssh_symbol = "";
        format = "[ $hostname 󰟀 ]($style)";
        style = "fg:#${color.base06-hex} bg:#${color.base09-hex}";
      };

      directory = {
        disabled = false;
        truncation_length = 3;
        truncation_symbol = "…/";
        format = "[ $path ]($style)";
        style = "fg:#${color.base06-hex} bg:#${color.base0B-hex}";
      };

      git_branch = {
        disabled = false;
        symbol = "";
        format = "[ $symbol $branch ]($style)";
        style = "fg:#${color.base06-hex} bg:#${color.base0D-hex}";
      };

      git_status = {
        disabled = false;
        format = "[($all_status$ahead_behind)]($style)";
        style = "fg:#${color.base06-hex} bg:#${color.base0D-hex}";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:#${color.base0B-hex})";
        error_symbol = "[](bold fg:#${color.base08-hex})";
      };
    };
  };
}