{ config, ... }:
{
  flake.homeModules.nixos-desktop = { pkgs, ... }: {
    services.clipse = {
      enable = true;

      settings = {
        allowDuplicates = false;

        imageDisplay = {
          heightCut = 2;
          scaleX = 9;
          scaleY = 9;
          type = "basic";
        };

        keyBindings = {
          choose = "enter";
          clearSelected = "S";
          down = "down";
          end = "end";
          filter = "/";
          home = "home";
          more = "?";
          nextPage = "right";
          prevPage = "left";
          preview = " ";
          quit = "q";
          remove = "x";
          selectDown = "ctrl+down";
          selectSingle = "s";
          selectUp = "ctrl+up";
          togglePin = "p";
          togglePinned = "tab";
          up = "up";
          yankFilter = "ctrl+s";
        };

        maxHistory = 100;
      };

      theme = {
        DividerDot = "#${config.colors.base0C-hex}";
        NormalTitle = "#${config.colors.base00-hex}";
        PageActiveDot = "#${config.colors.base0C-hex}";
        PinIndicatorColor = "#${config.colors.base0A-hex}";
        SelectedDesc = "#${config.colors.base12-hex}";
        SelectedDescBorder = "#${config.colors.base0C-hex}";
        SelectedTitle = "#${config.colors.base08-hex}";
        StatusMsg = "#${config.colors.base0B-hex}";
        TitleFore = "#${config.colors.base0E-hex}";
        UseCustom = true;
      };
    };

    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
