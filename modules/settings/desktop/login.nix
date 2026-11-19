{
  flake.nixosModules.desktop-settings = { config, lib, pkgs, ... }: {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = lib.concatStringsSep " " [
            "${pkgs.tuigreet}/bin/tuigreet"
            "--sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions"
            "--time"
            "--user-menu"
            "--remember"
            "--remember-user-session"
            "--asterisks"
          ];

          user = "greeter";
        };
      };

      useTextGreeter = true;
    };
  };
}
