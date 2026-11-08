{
  flake.nixosModules.nixos-server-kaede = { pkgs, ... }: {
    services.kavita = {
      enable = true;

      package = pkgs.kavita;

      credentials = {
        token_key = "/home/laurent/.secrets/kavita_token.key"; # head -c 64 /dev/urandom | base64 --wrap=0
      };

      settings = {
        Port = 5000;
      };
    };
  };
}
