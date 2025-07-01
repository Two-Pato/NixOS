{ config, pkgs, ... }:

{
  fileSystems."/mnt/media" = {
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
}
