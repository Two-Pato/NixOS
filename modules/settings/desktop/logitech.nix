{
  flake.nixosModules.desktop-settings = { pkgs, ... }: {
    programs.openlogi.enable = true;
  };
}
