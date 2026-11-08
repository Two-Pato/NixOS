{
  flake.nixosModules.games = { pkgs, ... }: {
    programs.steam = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      faugus-launcher
      protonup-qt

      (retroarch.withCores (
        cores: with cores; [
          dolphin # Nintendo GameCube / Wii
          melonds # Nintendo DS
          mgba # Game Boy Advance
          pcsx2 # Playstation 2
          snes9x # Nintendo SNES
        ]
      ))
    ];
  };
}
