{ config, pkgs, ... }:

{
  # 1. Abilita il servizio Caddy
  services.caddy = {
    enable = true;

    # 2. Specifica la tua email per l'ottenimento automatico dei certificati Let's Encrypt
    email = "sonic.gioia@gmail.com";

    # 3. Definisci i virtualHosts per i tuoi servizi
    virtualHosts = {

      # Configurazione del dominio principale
      "drunk.ddns.net" = {
        extraConfig = ''
          #  Blocco di gestione principale del dominio
          handle {
            # ➡️ Gestione del traffico  (Root del dominio)
            # Qualsiasi richiesta che non è gestita da un blocco 'route' o 'handle'     respond "Hello, world!"
          }

          #  Blocco per Copyparty (sottodirectory /copyparty)
          # Utilizziamo 'route' per forzare una corrispondenza esatta del prefisso
          # e manipolare il percorso prima del proxy.
          route /copyparty* {
            # 1. Riscrive il percorso per rimuovere /copyparty/ prima di inviarlo al backend
            # Questo è cruciale perché Copyparty si aspetta la root.


            # 2. Proxy verso la porta di Copyparty
            reverse_proxy 127.0.0.1:3923{
                # 💡 AGGIUNGI QUESTI HEADER
                header_up X-Real-IP {remote_host}
                header_up X-Forwarded-For {remote_host}
                header_up Host {host}
                header_up X-Forwarded-Proto {scheme}
            }
          }

          route /jellyfin* {
            # 1. Riscrive il percorso per rimuovere /copyparty/ prima di inviarlo al backend
            # Questo è cruciale perché Copyparty si aspetta la root.
            # 2. Proxy verso la porta di Copyparty
            reverse_proxy localhost:8096
          }
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
