{
  flake.nixosModules.core-settings = { pkgs, ... }: {
    users.users.laurent = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.bash;
    };

    security.sudo.enable = true;
  };

  flake.darwinModules.core-settings = { pkgs, ... }: {
    users.users.laurent = {
      home = "/Users/laurent";
      shell = pkgs.zsh;
    };

    system.primaryUser = "laurent";
  };
}
