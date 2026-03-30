{
  flake.nixosModules.mahiro = { config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      curl
      tray-tui
      usbutils
      wget
    ];
  };
}
