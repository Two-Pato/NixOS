{ config, pkgs, ... }:

{
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Nautilus
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services.gnome.sushi.enable = true;
}
