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
}
