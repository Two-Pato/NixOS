{
  flake.nixosModules.core-settings = {
    services.openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    users.users.laurent.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDh68r6gWyqkKVm3ip/CkoBtYvPGvO/i/NfkD/aJ4vqw mihari"
    ];

    programs.ssh = {
      extraConfig = ''
        Host asahi
          HostName 10.0.20.21
          User laurent

        Host kaede
          HostName 10.0.20.22
          User laurent

        Host miyo
          HostName 10.0.20.23
          User laurent
      '';

      knownHosts = {
        asahi = {
          hostNames = [
            "asahi"
            "10.0.20.21"
          ];

          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJrGYrmEZ/oHVYrv8vRzIqRS0IyplRJcGuzXYxhyIvth";
        };

        kaede = {
          hostNames = [
            "kaede"
            "10.0.20.22"
          ];

          publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBjuah21q4amEiOeOCTprz/9lRNnhfza3mU7YOU8SKWh";
        };

        miyo = {
          hostNames = [
            "miyo" 
            "10.0.20.23" 
          ];

          publicKey = "ssh-ed25519 AAAAC3...";
        };
      };
    };
  };
}
