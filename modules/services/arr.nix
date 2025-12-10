{ config, pkgs, pkgs-unstable, ... }:
{
  users.users.drunkserver = {
    isSystemUser = true;
    group = "drunkserver";
    description = "Utente dedicato per la suite Servarr e qBittorrent";
    # Impedisce il login interattivo per maggiore sicurezza
    shell = "/run/current-system/sw/bin/nologin";
    # Aggiungi l'utente al gruppo mediaaccess per i permessi di I/O
    extraGroups = [ "mediaaccess" "copyparty"];
  };

  users.groups.drunkserver = {};

  # 2. Definizione del gruppo per la condivisione dei media
  # Assicurati che il tuo utente principale (Drunk) sia anch'esso in questo gruppo


  # Esempio: assicurati che l'utente Drunk sia nel gruppo mediaaccess
  # (Se l'utente Drunk è definito altrove, aggiungi la linea 'extraGroups = [ "mediaaccess" ];' alla sua definizione)
  # Se l'utente 'Drunk' non è definito in questo modulo, ignorare questo blocco commentato.
  # users.users.Drunk = {
  #   extraGroups = [ "mediaaccess" ];
  #   # ... altre configurazioni del tuo utente principale
  # };

  # 3. Configurazione dei servizi Servarr e qBittorrent
  # Tutti i servizi vengono eseguiti sotto l'utente 'drunkserver'

  # 1. Definizione dell'utente e del gruppo dedicati per i servizi
  services.prowlarr = {
    enable = true;
    package = pkgs-unstable.prowlarr;
    openFirewall = true;
  };

  services.sonarr = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
  };

  services.radarr = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
  };

  services.lidarr = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
    };

  services.bazarr = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
    };

  services.jellyseerr = {
    enable = true;
    openFirewall = true;
  };

  services.qbittorrent = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
    };

}
