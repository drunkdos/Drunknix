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

          #  Blocco per Copyparty
          route /copyparty* {
            # 2. Proxy verso la porta di Copyparty
            reverse_proxy 127.0.0.1:3923
          }

          route /jellyfin* {
            # Proxy verso la porta di jellyfin
            reverse_proxy localhost:8096
          }

          route /sonarr* {
            reverse_proxy localhost:8989
          }
          route /radarr* {
            reverse_proxy localhost:7878
          }
          route /prowlarr* {
            reverse_proxy localhost:9696
          }

          # 1. Reindirizzamento senza slash finale (/torrent -> /torrent/)
          route /torrent {
            redir /torrent/ 308
          }

          # 2. Usa handle_path per RISCRIVERE il percorso (tolto /torrent)
          handle_path /torrent/* {
            reverse_proxy localhost:8080 {
              # 3. Impostazioni Cruciali degli Header

              # Rimuove Referer/Origin per aggirare problemi CSRF
              header_up -Referer
              header_up -Origin

              # Correzione del percorso del cookie (fondamentale per il login su subpath)
              copy_headers -set-cookie
              @setcookie header Set-Cookie
              rewrite @setcookie "SID=(.+); Path=/" "SID=$1; Path=/torrent/"
            }
          }
        '';
      };

    # 2. Configurazione Sottodominio Jellyseerr
      "jellyseer.drunk.ddns.net" = {
        extraConfig = ''
          # Configurazione Caddy più semplice possibile per sottodominio
          reverse_proxy localhost:5055
        '';
      };
    "torrent.drunk.ddns.net" = {
        extraConfig = ''
          reverse_proxy localhost:8080
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
