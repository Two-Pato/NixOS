{
  flake.nixosModules.nixos-server-kaede = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      handbrake
    ];

    systemd.paths.handbrake-watch = {
      wantedBy = [ "multi-user.target" ];
      unitConfig.RequiresMountsFor = "/mnt/media";
      pathConfig = {
        DirectoryNotEmpty = "/mnt/media/Handbrake/in";
        Unit = "handbrake-watch.service";
      };
    };

    systemd.services.handbrake-watch = {
      description = "Encode videos from /mnt/media/Handbrake/in with HandBrake";
      path = with pkgs; [
        handbrake
        coreutils
        findutils
      ];

      environment = {
        IN_DIR = "/mnt/media/Handbrake/in";
        OUT_DIR = "/mnt/media/Handbrake/out";
        FAILED_DIR = "/mnt/media/Handbrake/failed";
        DONE_DIR = "/mnt/media/Handbrake/done";
        PRESET_FILE = "/mnt/media/Handbrake/Presets/Anime.json";
        PRESET_NAME = "Anime";
        OUT_EXT = "mkv";
      };

      unitConfig = {
        RequiresMountsFor = "/mnt/media";
        StartLimitIntervalSec = 0;
      };

      serviceConfig = {
        Type = "oneshot";
        User = "laurent";
        Group = "users";
        ExecStart = "${pkgs.callPackage ../../../scripts/handbrake-watch.nix { }}/bin/handbrake-watch";
        Nice = 19;
        IOSchedulingClass = "idle";
        TimeoutStartSec = "infinity";
      };
    };
  };
}
