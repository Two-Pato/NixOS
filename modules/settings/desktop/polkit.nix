{
  flake.nixosModules.desktop-settings = { pkgs, ... }: {
    security.polkit.enable = true;

    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      after = [ "graphical-session.target" ];
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
        Type = "simple";
      };
    };

    environment.systemPackages = with pkgs; [
      polkit_gnome
    ];
  };
}
