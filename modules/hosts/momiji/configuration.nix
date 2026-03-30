{
  flake.darwinModules.momiji = { config, pkgs, ... }: {
    users.users.laurent = {
      home = "/Users/laurent";
      shell = pkgs.zsh;
    };

    system.primaryUser = "laurent";
  };
}
