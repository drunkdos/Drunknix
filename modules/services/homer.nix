{ config, lib, pkgs, pkgs-unstable, stylix, ... }:


{
 services.homer = {
    enable = true;
    package = pkgs.homer;
    virtualHost.domain = "drunk.ddns.net";
    virtualHost.caddy.enable = true;
    settings ={
        title = "Drunk-Homeserver";
        subtitle = "che l'autismo sia con noi";
        header = true;
        footer = false;
        connectivityCheck = true;
        columns = "auto";

        proxy = {
          useCredentials = false;
        };

        defaults = {
          layout = "columns";
          colorTheme = "auto";
        };

        theme = "default";
        colors = with config.lib.stylix.colors; {
          dark = {
            highlight-primary = withHashtag.base0D;
            highlight-secondary = withHashtag.base0D;
            highlight-hover = withHashtag.base0E;
            background = withHashtag.base00;
            card-background = withHashtag.base01;
            text = withHashtag.base07;
            text-header = withHashtag.base07;
            text-title = withHashtag.base07;
            text-subtitle = withHashtag.base07;
            card-shadow = "rgba(0, 0, 0, 0.4)";
            link = withHashtag.base0D;
            link-hover = withHashtag.base0A;
          };
        };

        message = {
          style = "highlight-primary";
          title = "Sporoco Negro!";
          icon = "fa fa-exclamation-triangle";
          content = "Occhio che qui è buio e non ci si vede!";
        };

        links = [
          {
            name = "Repo";
            icon = "fab fa-github";
            url = "https://github.com/drunkdos/Drunknix";
            target = "_blank";
          }
          {
            name = "Wiki";
            icon = "fas fa-book";
            url = "https://wiki.nixos.org/wiki/NixOS_Wiki";
          }
        ];

        services = [
          {
            name = "Application";
            icon = "fas fa-code-branch";
            items = [
              {
                name = "Jellyfin";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/jellyfin.png";
                subtitle = "Guarda qualcosa 🏴‍☠";
                tag = "app";
                keywords = "mediaserver media streaming tv";
                url = "https://drunk.ddns.net/jellyfin";
              }
              {
                name = "Copyparty";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/copyparty.png";
                subtitle = "Fileshare";
                tag = "app";
                tagstyle = "is-success";
                url = "https://drunk.ddns.net/copyparty";
              }
              {
              name = "QbitTorrent";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/qbittorrent.png";
                subtitle = "Navigando i sette mari";
                tag = "app";
                tagstyle = "is-success";
                url = "https://torrent.drunk.ddns.net/";
              }
            ];
          }
          {
            name = "Servarr";
            icon = "fas fa-sailboat";
            items = [
              {
                name = "Jellyseer";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/jellyseerr.png";
                tag = "aargh";
                url = "https://jellyseer.drunk.ddns.net";
              }
              {
                name = "Sonarr";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/sonarr.png";
                tag = "aargh";
                url = "https://drunk.ddns.net/sonarr";
              }
              {
                name = "Radarr";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/radarr.png";
                tag = "aargh";
                url = "https://drunk.ddns.net/radarr";
              }
              {
                name = "Lidarr";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/lidarr.png";
                tag = "aargh";
                url = "https://drunk.ddns.net/lidarr";
              }
              {
              name = "Bazarr";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/bazarr.png";
                tag = "aargh";
                url = "https://drunk.ddns.net/bazarr";
              }
              {
              name = "Prowlarr";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/prowlarr.png";
                tag = "aargh";
                url = "https://drunk.ddns.net/prowlarr";
              }
            ];
          }
        ];
      };

   };
}
