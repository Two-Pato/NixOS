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
            directory = "/var/cache/tuigreet";
            user = "greeter";
            group = "greeter";
            mode = "0755";
          }

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
          commonMountOptions = [
            "x-gvfs-hide"
            "x-gdu.hide"
          ];

          directories = [
            ".cache"
            ".config/clipse"
            ".config/Code"
            ".config/ghb"
            ".config/gthumb"
            ".config/mozilla"
            ".config/openlogi"
            ".config/Upscayl"
            ".local/state/wireplumber"
            ".secrets"
            ".vscode"
            ".vscode-shared"

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
