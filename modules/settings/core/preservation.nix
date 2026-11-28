{
  flake.nixosModules.core-settings = { config, lib, ... }: {
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
        ]
        ++ lib.optionals (config.networking.hostName == "asahi") [
          {
            directory = "/var/lib/caddy";
            user = "caddy";
            group = "caddy";
            mode = "0700";
          }
          {
            directory = "/var/lib/private";
            mode = "0700";
          }
        ]
        ++ lib.optionals (config.networking.hostName == "kaede") [
          {
            directory = "/var/cache/jellyfin";
            user = "jellyfin";
            group = "jellyfin";
            mode = "0700";
          }
          {
            directory = "/var/lib/jellyfin";
            user = "jellyfin";
            group = "jellyfin";
            mode = "0700";
          }
          {
            directory = "/var/lib/kavita";
            user = "kavita";
            group = "kavita";
            mode = "0700";
          }
          {
            directory = "/var/lib/private";
            mode = "0700";
          }
        ]
        ++ lib.optionals (lib.elem config.networking.hostName [ "mahiro" "mihari" ]) [
          {
            directory = "/var/cache/tuigreet";
            user = "greeter";
            group = "greeter";
            mode = "0755";
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
            "x-gdu.hide"
            "x-gvfs-hide"
            "x-gvfs-trash"
          ];

          directories = [
            ".cache"
            ".secrets"

            "NixOS"

            {
              directory = ".ssh";
              mode = "0700";
            }
          ]
          ++ lib.optionals (lib.elem config.networking.hostName [ "mahiro" "mihari" ]) [
            ".config/clipse"
            ".config/gthumb"
            ".config/mozilla"
            ".config/openlogi"
            ".local/state/wireplumber"

            "Desktop"
            "Documents"
            "Downloads"
            "Music"
            "Pictures"
            "Programs"
            "Videos"
          ]
          ++ lib.optionals (config.networking.hostName == "mahiro") [
            ".config/faugus-launcher"
            ".config/retroarch"
            ".local/share/faugus-launcher"
            ".local/share/Steam"

            "Games"
          ]
          ++ lib.optionals (config.networking.hostName == "mihari") [
            ".config/Code"
            ".config/ghb"
            ".config/Upscayl"

            ".vscode"
            ".vscode-shared"
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
