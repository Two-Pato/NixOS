{
  flake.homeModules.nixos-extra = { config, ... }: {
    programs.yt-dlp = {
      enable = true;

      settings = {
        embed-metadata = true;
        embed-thumbnail = true;
        merge-output-format = "mkv";
        no-playlist = true;
        output = "%(uploader)s/%(title)s [%(id)s].%(ext)s";
        paths = "${config.home.homeDirectory}/Downloads";
      };
    };
  };
}
