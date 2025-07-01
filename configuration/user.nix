{ config, pkgs, ... }:

{
  users.users.laurent = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Allow sudo usage
    shell = pkgs.bash;
  };

  security.sudo.enable = true;
}
