{
  flake.homeModules.nixos-extra = {
    programs.mpv = {
      enable = true;

      bindings = {
        DOWN = "add volume -5";
        UP = "add volume 5";
      };

      config = {
        keep-open = true;
        target-colorspace-hint = false;
        volume = 100;
        volume-max = 150;
      };
    };
  };
}
