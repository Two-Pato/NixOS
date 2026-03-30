{
  flake.nixosModules.desktop = { pkgs, ... }: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --user-menu --remember --remember-user-session --asterisks";
          user = "greeter";
        };
      };

      useTextGreeter = true;
    };
  };
}
