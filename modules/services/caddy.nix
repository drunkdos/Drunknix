{ config, lib, pkgs, pkgs-unstable, ... }:

{
  services.caddy = {
    enable = true;
    virtualHosts."drunk.ddns.net" = {
      # Configurazione del reverse proxy
      extraConfig = ''
        # Configurazione di base
        bind 0.0.0.0

        # Route per Jellyfin
        redir /jellyfin /jellyfin/
          reverse_proxy /jellyfin/* localhost:8096
        }

        # Route per Copyparty
        handle /copyparty/* {
          reverse_proxy localhost:3923
        }

        # Pagina di default con messaggio "ciao"
        handle {
          respond "DIOCANE" 200
        }
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
