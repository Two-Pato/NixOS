{
  flake.nixosModules.core = { pkgs, ... }: {
    users.users.laurent = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.bash;
    };

    security.sudo.enable = true;
  };
}
