{
  flake.nixosModules.core-settings = {
    services.openssh.enable = true;
  };
}
