{ config, pkgs, ... }:

{
  # Imports and Nix Settings
  imports = [

  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.download-buffer-size = 500000000; # 500 MB
  nixpkgs.config.allowUnfree = true;

  # Packages and Fonts
  #environment.systemPackages = with pkgs; [

  #];

  #fonts.packages = with pkgs; [

  #];

  # Home Manager
  home-manager.extraSpecialArgs = {
    inherit (config.networking) hostName;
  };

  # System Version
  system.stateVersion = "25.05";
}
