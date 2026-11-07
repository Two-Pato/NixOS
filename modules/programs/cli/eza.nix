{
  flake.homeModules.cli = {
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      colors = "auto";
      icons = "auto";

      extraOptions = [
        "--group-directories-first"
        "--no-permissions"
        "--no-user"
        "--oneline"
      ];
    };
  };
}
