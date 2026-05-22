{
  flake.nixosModules.core-settings = { config, lib, pkgs, ... }: {
    environment.shellAliases = lib.mkMerge [
      {
        # Useful stuff
        ipv4 = "ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d' ' -f6 | cut -d/ -f1";
        error = "journalctl -b -p err";
        count-folder = "find . -mindepth 1 -maxdepth 1 -type d | wc -l";

        # Nix
        "rebuild-${config.networking.hostName}" = "sudo nixos-rebuild switch --flake /etc/nixos/.#${config.networking.hostName}";
        update = "nix flake update --flake /etc/nixos/";
        garbage = "sudo nix-collect-garbage --delete-old && nix-collect-garbage --delete-old";
      }

      (lib.mkIf (config.networking.hostName == "mihari") {
        manga-convert = "nix-shell -p python3 python3Packages.lxml --run 'python \"/home/laurent/Programs/Manga-Converter/converter.py\"' && exit";
      })
    ];

    environment.systemPackages = with pkgs; [
      (import ../../../scripts/mkv-convert.nix { inherit pkgs; })
      (import ../../../scripts/magick-cut.nix { inherit pkgs; })
      (import ../../../scripts/magick-merge.nix { inherit pkgs; })
      (import ../../../scripts/magick-fix.nix { inherit pkgs; })
    ];
  };

  flake.darwinModules.core-settings = { config, lib, pkgs, ... }: {
    environment.shellAliases = {
      rebuild-momiji = "sudo darwin-rebuild switch --flake ./NixOS/.#momiji";
      garbage = "sudo nix-collect-garbage --delete-old && nix-collect-garbage --delete-old";
    };
  };
}
