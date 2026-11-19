{
  flake.nixosModules.core-settings = {
    preservation = {
      enable = true;

      preserveAt."/persistent" = {
        directories = [
          "/etc/nixos"
          "/etc/ssh"

          "/var/lib/bluetooth"
          "/var/lib/systemd/timers"
          "/var/lib/systemd/coredump"
          "/var/log"

          {
            directory = "/var/lib/nixos";
            inInitrd = true;
          }
        ];

        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
        ];

        users.laurent = {
          directories = [
            ".cache"
            ".config/mozilla"
            ".secrets"

            {
              directory = ".ssh";
              mode = "0700";
            }

            "Desktop"
            "Documents"
            "Downloads"
            "Music"
            "NixOS"
            "Pictures"
            "Programs"
            "Videos"
          ];

          files = [
            ".bash_history"
          ];
        };
      };
    };

    systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];
  };
}
