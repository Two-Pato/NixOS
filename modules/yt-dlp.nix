{ config, lib, pkgs, ... }:

{
  programs.yt-dlp = {
    enable = true;

    settings = {
      format = "best";
      outtmpl = "~/Downloads/%(title)s.%(ext)s";
      postprocessors = [
        {
          key = "FFmpegVideoConvertor";
          preferredformat = "mkv";
        }
      ];
      embedthumbnail = true;
      addmetadata = true;
      noplaylist = true;
    };
  };
}
