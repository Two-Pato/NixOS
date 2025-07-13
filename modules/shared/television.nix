{ config, lib, pkgs, ... }:

{
  programs.television = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings.ui = {
      input_bar_position = "bottom";
      use_nerd_font_icons = true;
      preview_panel.scrollbar = true;
    };

     channels = { };
  };
}
