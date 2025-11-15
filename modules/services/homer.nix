{ config, lib, pkgs, pkgs-unstable, ... }:


{
 services.homer = {
    enable = true;
    package = pkgs.homer;
    virtualHost.domain = "drunk.ddns.net";
    virtualHost.caddy.enable = true;
    settings ={
        title = "Drunkserver";
        subtitle = "che l'autismo isa con te";
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
                logo = "$\{../../assets/jellyfin.png}";
                subtitle = "Guarda qualcosa 🏴‍☠";
                tag = "app";
                keywords = "mediaserver media streaming tv";
                url = "https://drunk.ddns.net/jellyfin";
              }
              {
                name = "Copyparty";
                logo = "$\{../../assets/copyparty.png}";
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
                logo = "assets/tools/sample.png";
                tag = "other";
                url = "http://192.168.0.1/";
              }
            ];
          }
        ];
      };

   };
}
