{
  flake.nixosModules.desktop-settings = { config, pkgs, ... }: {
    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions --time --user-menu --remember --remember-user-session --asterisks";
          user = "greeter";
        };
      };

      useTextGreeter = true;
    };
  };
}
