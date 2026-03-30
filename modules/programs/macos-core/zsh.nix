{
  flake.homeModules.macos-core = {
    programs.zsh = {
      enable = true;

      autosuggestion.enable = true;

      history = {
        ignoreAllDups = true;
        ignorePatterns = [
          "ls"
          "la"
          "ll"
          "lt"
          "cd *"
          "clear"
          "exit"
        ];
      };
    };
  };
}
