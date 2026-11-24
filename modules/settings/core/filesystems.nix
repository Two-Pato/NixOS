{
  flake.nixosModules.core-settings = { config, lib, pkgs, ... }:
  let
    cifsOptions = [
      "_netdev"
      "noauto"
      "x-systemd.automount"
      "x-systemd.idle-timeout=60s"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/home/laurent/.secrets/nas_token"
      "uid=1000"
      "gid=100"
    ];
  in
  {
    systemd.tmpfiles.settings.preservation = {
      "/home/laurent/.config".d = {
        user = "laurent";
        group = "users";
        mode = "0755";
      };

      "/home/laurent/.local".d = {
        user = "laurent";
        group = "users";
        mode = "0755";
      };

      "/home/laurent/.local/share".d = {
        user = "laurent";
        group = "users";
        mode = "0755";
      };

      "/home/laurent/.local/state".d = {
        user = "laurent";
        group = "users";
        mode = "0755";
      };
    };

    systemd.user.tmpfiles.rules = [
      "R %h/.cache/thumbnails - - - - -"
    ];

    fileSystems = lib.mkMerge [
      {
        "/nix".neededForBoot = true;
        "/persistent".neededForBoot = true;
      }

      (lib.mkIf (config.networking.hostName == "mihari") {
        "/mnt/backup" = {
          device = "//10.0.20.32/backup";
          fsType = "cifs";
          options = cifsOptions;
        };
      })

      (lib.mkIf (lib.elem config.networking.hostName [ "mihari" "kaede" ]) {
        "/mnt/media" = {
          device = "//10.0.20.31/media";
          fsType = "cifs";
          options = cifsOptions;
        };
      })

      (lib.mkIf (config.networking.hostName == "mahiro") {
        "/mnt/videogames" = {
          device = "//10.0.20.31/videogames";
          fsType = "cifs";
          options = cifsOptions;
        };
      })
    ];

    environment.systemPackages = with pkgs; [
      cifs-utils
    ];
  };
}
