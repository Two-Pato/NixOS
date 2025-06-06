{ ... }:

{
  environment.variables = {
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Adwaita";
    HYPRCURSOR_SIZE = "24";
    OZONE_PLATFORM = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  environment.shellAliases = {
    ls = "ls --color=auto";
    grep = "grep --color=auto";
    manga-convert = "python \"/home/laurent/Programs/Converter/Manga-Converter/converter.py\" && exit";
    manga-unzip = "python \"/home/laurent/Programs/Converter/Manga-Converter/unziper.py\" && exit";
    count-folder = "find . -mindepth 1 -maxdepth 1 -type d | wc -l";
    ipv4 = "ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d' ' -f6 | cut -d/ -f1";
    error = "journalctl -b -p err";
  };
}