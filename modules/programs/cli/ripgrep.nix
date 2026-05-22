{
  flake.homeModules.cli = {
    programs.ripgrep = {
      enable = true;

      arguments = [
        "--smart-case"
        "--hidden"
        "--max-columns=150"
        "--max-columns-preview"
        "--glob=!.git/"
      ];
    };
  };
}
