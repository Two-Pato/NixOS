{
  flake.nixosModules.core = { pkgs, ... }: {
    users.users.laurent = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.bash;
    };

    security.sudo.enable = true;
  };

  flake.darwinModules.core = { pkgs, ... }: {
    users.users.laurent = {
      home = "/Users/laurent";
      shell = pkgs.zsh;
    };

    system.primaryUser = "laurent";
  };
}
