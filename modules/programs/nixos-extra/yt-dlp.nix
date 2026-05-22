{
  flake.homeModules.nixos-extra = { config, ... }: {
    programs.yt-dlp = {
      enable = true;

      settings = {
        paths = "${config.home.homeDirectory}/Downloads";
        output = "%(uploader)s/%(title)s [%(id)s].%(ext)s";
        merge-output-format = "mkv";
        embed-thumbnail = true;
        embed-metadata = true;
        no-playlist = true;
      };
    };
  };
}
