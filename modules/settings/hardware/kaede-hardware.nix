{
  flake.nixosModules.kaede-hardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
      [ (modulesPath + "/profiles/qemu-guest.nix")
      ];

    boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "virtio_scsi" "sd_mod" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/978f43e9-51d5-4dfb-915f-4870315f1207";
        fsType = "ext4";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/ec1ceac0-117f-4e9f-97c7-e7a4ef2800e1"; }
      ];

    networking.useDHCP = lib.mkDefault true;
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
