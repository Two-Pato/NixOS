{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
}
