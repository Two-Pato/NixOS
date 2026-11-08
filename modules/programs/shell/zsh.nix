{
  flake.homeModules.zsh = {
    programs.zsh = {
      enable = true;

      autosuggestion.enable = true;

      history = {
        ignoreAllDups = true;
        ignorePatterns = [
          "cd *"
          "clear"
          "exit"
          "la"
          "ll"
          "ls"
          "lt"
        ];
      };
    };
  };
}
