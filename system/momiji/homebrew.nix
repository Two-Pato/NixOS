{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = true;
      cleanup = "zap";
    };

    caskArgs.no_quarantine = true;
    global.brewfile = true;

    casks = [
      "handbrake"
      #"iina"
      #"opera"
      #"parsec"
      "protonvpn"
      #"transmission"
      #"visual-studio-code"
    ];

    brews = [

    ];

    taps = [

    ];
  };

  environment = {
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
}