{ config, lib, pkgs, ... }:

{
  programs.steam = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    (bottles.override { removeWarningPopup = true; })

    (retroarch.withCores (cores: with cores; [
      snes9x # Nintendo SNES
      mgba # Game Boy Advance
      dolphin # Nintendo GameCube / Wii
    ]))
  ];
}
