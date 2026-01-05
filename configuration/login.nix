{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --user-menu --remember --cmd ${pkgs.uwsm}/bin/uwsm start hyprland-uwsm.desktop --remember-user-session --asterisks";
        user = "greeter";
      };
    };

    useTextGreeter = true;
  };
}
