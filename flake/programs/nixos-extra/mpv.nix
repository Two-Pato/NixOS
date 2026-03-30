{
  flake.homeModules.nixos-extra = {
    programs.mpv = {
      enable = true;

      config = {
        keep-open = true;
        target-colorspace-hint = false;
        volume = 100;
        volume-max = 150;
      };

      bindings = {
        UP = "add volume 5";
        DOWN = "add volume -5";
      };
    };
  };
}
