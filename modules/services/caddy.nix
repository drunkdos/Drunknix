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
    # ----------------------------------------------------

          route /jellyfin* {
            # Proxy verso la porta di jellyfin
            reverse_proxy localhost:8096
          }

   # ----------------------------------------------------

          route /sonarr* {
            reverse_proxy localhost:8989
          }
          route /radarr* {
            reverse_proxy localhost:7878
          }
          route /readarr* {
            reverse_proxy localhost:8787
          }
          route /prowlarr* {
            reverse_proxy localhost:9696
          }
          route /bazarr* {
            reverse_proxy localhost:6767
          }

        '';
      };

    # ----------------------------------------------------

      # 2. Configurazione Sottodominio Jellyseerr
      "jellyseer.drunk.ddns.net" = {
        extraConfig = ''
          # Configurazione Caddy più semplice possibile per sottodominio
          reverse_proxy localhost:5055
        '';
      };

    # ----------------------------------------------------

      # 3. Configurazione Sottodominio qBittorrent (Opzionale ma Consigliato)
      # Se vuoi anche qBittorrent su sottodominio per massima pulizia:
      "torrent.drunk.ddns.net" = {
        extraConfig = ''
          reverse_proxy localhost:8080
        '';
      };

    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
