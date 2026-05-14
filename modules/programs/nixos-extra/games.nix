{
  flake.nixosModules.games = { pkgs, ... }: {
    programs.steam.enable = true;

    #Fix for bottles delete if not needed anymore
    nixpkgs.overlays = [
      (_: prev: {
        openldap = prev.openldap.overrideAttrs {
          doCheck = !prev.stdenv.hostPlatform.isi686;
        };
      })
    ];

    environment.systemPackages = with pkgs; [
      (bottles.override { removeWarningPopup = true; })

      (retroarch.withCores (cores: with cores; [
        snes9x  # Nintendo SNES
        mgba    # Game Boy Advance
        melonds # Nintendo DS
        dolphin # Nintendo GameCube / Wii
        pcsx2   # Playstation 2
      ]))
    ];
  };
}
