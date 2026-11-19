{
  flake.nixosModules.core-settings = { pkgs, ... }: {
    users.mutableUsers = false;
    users.users.laurent = {
      extraGroups = [ "wheel" ];
      hashedPasswordFile = "/persistent/secrets/password";
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
