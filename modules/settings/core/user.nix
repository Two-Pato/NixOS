{
  flake.nixosModules.core-settings = { pkgs, ... }: {
    users.users.laurent = {
      extraGroups = [ "wheel" ];
      isNormalUser = true;
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
