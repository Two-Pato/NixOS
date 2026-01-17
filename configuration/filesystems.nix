{ config, lib, pkgs, ... }:

{
  fileSystems."/mnt/media" = lib.mkIf (lib.elem config.networking.hostName [ "mihari" "kaede" ]) {
    device = "//10.0.20.31/media";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/home/laurent/.secrets/nas_token"
      "uid=1000"
      "gid=100"
    ];
  };

  fileSystems."/mnt/videogames" = lib.mkIf (config.networking.hostName == "mahiro") {
    device = "//10.0.20.31/videogames";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/home/laurent/.secrets/nas_token"
      "uid=1000"
      "gid=100"
    ];
  };

  fileSystems."/mnt/backup" = lib.mkIf (config.networking.hostName == "mihari") {
    device = "//10.0.20.32/backup";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "user"
      "users"
      "credentials=/home/laurent/.secrets/nas_token"
      "uid=1000"
      "gid=100"
    ];
  };

  fileSystems."/home/laurent/.cache/thumbnails" = {
    fsType = "tmpfs";
    neededForBoot = false;
    options = [
      "size=512M"
      "uid=1000"
      "gid=100"
    ];
  };
}
