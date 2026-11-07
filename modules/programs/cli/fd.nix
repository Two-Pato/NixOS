{
  flake.homeModules.cli = {
    programs.fd = {
      enable = true;

      hidden = true;
      ignores = [
        ".cache/"
        ".git/"
      ];
    };
  };
}
