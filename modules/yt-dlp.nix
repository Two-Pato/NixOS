{ config, lib, pkgs, ... }:

{
  programs.yt-dlp = {
    enable = true;

    settings = {
      paths = "${config.home.homeDirectory}/Downloads";
      merge-output-format = "mkv";
      embed-thumbnail = true;
      embed-metadata = true;
      no-playlist = true;
    };
  };
}
