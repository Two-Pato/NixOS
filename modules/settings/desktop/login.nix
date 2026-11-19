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
            #"--user-menu-min-uid 1000"
            #"--user-menu-max-uid 1000"
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
