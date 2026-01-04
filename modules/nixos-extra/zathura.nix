{ config, lib, pkgs, ... }:

{
  programs.zathura = {
    enable = true;

    package = pkgs.zathura.override {
      plugins = [
        pkgs.zathuraPkgs.zathura_cb
      ];
    };

    options = {
      font = "JetBrainsMono Nerd Font 14";
    };
  };
}
