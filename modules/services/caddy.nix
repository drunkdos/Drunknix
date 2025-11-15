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
        '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443 ];
}
