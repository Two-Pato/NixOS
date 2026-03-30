{
  flake.homeModules.nixos-core = {
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
