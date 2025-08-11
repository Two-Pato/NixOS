{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --user-menu --remember --cmd hyprland --remember-user-session --asterisks";
        user = "greeter";
      };
    };
  };
}
