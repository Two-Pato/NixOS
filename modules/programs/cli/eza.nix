{
  flake.homeModules.cli = {
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      colors = "always";
      icons = "always";
      extraOptions = [
        "--oneline"
        "--level=1"
        "--group-directories-first"
        "--no-permissions"
        "--no-user"
      ];
    };
  };
}
