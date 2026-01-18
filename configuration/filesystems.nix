{ config, lib, pkgs, ... }:

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
  fileSystems = lib.mkMerge [
    {
      "/home/laurent/.cache/thumbnails" = {
        fsType = "tmpfs";
        neededForBoot = false;
        options = [
          "size=512M"
          "uid=1000"
          "gid=100"
        ];
      };
    }

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

    (lib.mkIf (config.networking.hostName == "mihari") {
      "/mnt/backup" = {
        device = "//10.0.20.32/backup";
        fsType = "cifs";
        options = cifsOptions;
      };
    })
  ];
}
