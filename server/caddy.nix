{ config, lib, pkgs, ... }:

{
  services.caddy = {
    enable = true;

    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/porkbun@v0.3.1" ];
      hash = "sha256-YZ4Bq0hfOJpa0C2lKipEY4fqwzJbEFM7ci5ys9S3uAo=";
    };

    virtualHosts."jellyfin.nexuinque.de".extraConfig = ''
      reverse_proxy http://localhost:8096
      tls {
        dns porkbun {
          api_key {$APIKEY}
          api_secret_key {$APISECRETKEY}
        }
      }
    '';

    virtualHosts."kavita.nexuinque.de".extraConfig = ''
      reverse_proxy http://localhost:5000
      tls {
        dns porkbun {
          api_key {$APIKEY}
          api_secret_key {$APISECRETKEY}
        }
      }
    '';

    virtualHosts."proxmox.nexuinque.de".extraConfig = ''
      reverse_proxy https://10.0.20.11:8006 {
        transport http {
          tls {
            dns porkbun {
              api_key {$APIKEY}
              api_secret_key {$APISECRETKEY}
            }
          }
        }
      }
    '';

    virtualHosts."stirling.nexuinque.de".extraConfig = ''
      reverse_proxy http://localhost:8080
      tls {
        dns porkbun {
          api_key {$APIKEY}
          api_secret_key {$APISECRETKEY}
        }
      }
    '';
  };

  systemd.services.caddy.serviceConfig.EnvironmentFile = ["/home/laurent/.secrets/caddy_token"];
}
