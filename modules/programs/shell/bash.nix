{
  flake.homeModules.bash = {
    programs.bash = {
      enable = true;

      historyControl = [
        "erasedups"
        "ignoredups"
        "ignorespace"
      ];

      historyIgnore = [
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
}
