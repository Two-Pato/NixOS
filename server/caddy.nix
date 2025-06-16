{ config, lib, pkgs, ... }:

{
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/porkbun@v0.3.1" ];
      hash = "sha256-7TqepCX9F5AMAUJrH8wxdnrr3JMezhowyIPlfFYUQG8=";
    };

    virtualHosts."kavita.nexuinque.de".extraConfig = ''
      reverse_proxy http://localhost:5000
      tls {
        dns porkbun {
          api_key {env.PORKBUN_API_KEY}
          api_secret_key {env.PORKBUN_API_SECRET_KEY}
        }
      }
    '';
  };
}
