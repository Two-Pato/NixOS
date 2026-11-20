{
  flake.nixosModules.core-settings = { config, lib, ... }: {
    disko.devices = {
      nodev."/" = {
        fsType = "tmpfs";
        mountOptions = [
          "size=25%"
          "mode=755"
        ];
      };

      disk.main = {
        device = lib.mkMerge [
          (lib.mkIf (config.networking.hostName == "asahi")
            "/dev/vda")

          (lib.mkIf (config.networking.hostName == "kaede")
            "/dev/vda")

          (lib.mkIf (config.networking.hostName == "mahiro")
            "/dev/disk/by-id/nvme-eui.e8238fa6bf530001001b448b47035018")

          (lib.mkIf (config.networking.hostName == "mihari")
            "/dev/disk/by-id/nvme-eui.00000000000000000026b738301e07e5")

          (lib.mkIf (config.networking.hostName == "miyo")
            "/dev/vda")
        ];

        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            nix = {
              size = "50G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/nix";
              };
            };

            persist = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/persistent";
              };
            };
          };
        };
      };
    };
  };
}
