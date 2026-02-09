{ config, lib, pkgs, ... }:

{
  environment.shellAliases = lib.mkMerge [
    {
      # System
      rg = "rg -i";

      # Usefull stuff
      ipv4 = "ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d' ' -f6 | cut -d/ -f1";
      error = "journalctl -b -p err";
      count-folder = "find . -mindepth 1 -maxdepth 1 -type d | wc -l";

      # Nix
      update = "nix flake update --flake /etc/nixos/";
      garbage = "sudo nix-collect-garbage --delete-old && nix-collect-garbage --delete-old";
    }

    (lib.mkIf (config.networking.hostName == "mihari") {
      rebuild-mihari = "sudo nixos-rebuild switch --flake /etc/nixos/.#mihari";

      manga-convert = "nix-shell -p python3 python3Packages.lxml --run 'python \"/home/laurent/Programs/Manga-Converter/converter.py\"' && exit";
    })

    (lib.mkIf (config.networking.hostName == "mahiro") {
      rebuild-mahiro = "sudo nixos-rebuild switch --flake /etc/nixos/.#mahiro";
    })

    (lib.mkIf (config.networking.hostName == "kaede") {
      rebuild-kaede = "sudo nixos-rebuild switch --flake /etc/nixos/.#kaede";
    })

    (lib.mkIf (config.networking.hostName == "asahi") {
      rebuild-asahi = "sudo nixos-rebuild switch --flake /etc/nixos/.#asahi";
    })

    (lib.mkIf (config.networking.hostName == "momiji") {
      rebuild-momiji = "sudo darwin-rebuild switch --flake ./NixOS/.#momiji";
    })
  ];

  environment.systemPackages = with pkgs; [
    (import ./scripts/mkv-convert.nix { inherit pkgs; })
    (import ./scripts/magick-cut.nix { inherit pkgs; })
    (import ./scripts/magick-merge.nix { inherit pkgs; })
  ];
}
