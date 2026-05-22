{
  flake.homeModules.cli = {
    programs.fd = {
      enable = true;

      hidden = true;
      ignores = [
        ".git/"
        ".cache/"
      ];
    };
  };
}
