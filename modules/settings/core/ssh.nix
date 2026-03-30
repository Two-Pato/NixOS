{
  flake.nixosModules.core = {
    services.openssh.enable = true;
  };
}
