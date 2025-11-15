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
            highlight-primary = withHashtag.base09;
            highlight-secondary = withHashtag.base08;
            highlight-hover = withHashtag.base0A;
            background = withHashtag.base00;
            card-background = withHashtag.base01;
            text = withHashtag.base07;
            text-header = withHashtag.base07;
            text-title = withHashtag.base07;
            text-subtitle = withHashtag.base05;
            card-shadow = "rgba(0, 0, 0, 0.4)";
            link = withHashtag.base0D;
            link-hover = withHashtag.base0A;
          };
        };

        message = {
          style = "is-warning";
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
            ];
          }
          {
            name = "router";
            icon = "fas fa-heartbeat";
            items = [
              {
                name = "Fritzbox";
                logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/fritzbox.png";
                tag = "other";
                url = "http://192.168.1.1/";
              }
            ];
          }
        ];
      };

   };
}
