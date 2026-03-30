{
  flake.darwinModules.momiji = { config, pkgs, ... }: {
    users.users.laurent = {
      home = "/Users/laurent";
      shell = pkgs.zsh;
    };

    system.primaryUser = "laurent";

    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;
  };
}
