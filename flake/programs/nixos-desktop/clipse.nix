{ config, ... }: {
  flake.homeModules.nixos-desktop = { pkgs, ... }: {
    services.clipse = {
      enable = true;

      allowDuplicates = false;

      historySize = 100;

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

      imageDisplay = {
        type = "basic";
        scaleX = 9;
        scaleY = 9;
        heightCut = 2;
      };

      theme = {
        useCustomTheme = true;
        TitleFore = "#${config.colors.base0E-hex}";
        NormalTitle = "#${config.colors.base00-hex}";
        SelectedTitle = "#${config.colors.base08-hex}";
        SelectedDesc = "#${config.colors.base12-hex}";
        SelectedDescBorder = "#${config.colors.base0C-hex}";
        PageActiveDot = "#${config.colors.base0C-hex}";
        DividerDot = "#${config.colors.base0C-hex}";
        StatusMsg = "#${config.colors.base0B-hex}";
        PinIndicatorColor = "#${config.colors.base0A-hex}";
      };
    };

    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
