{ config, lib, pkgs, pkgs-unstable, ... }:

{

  services.caddy = {
    enable = true;
    virtualHosts."miodominio.noip.me".extraConfig = ''
      # Jellyfin
      handle /jellyfin/* {
        reverse_proxy localhost:8096
      }

      # Copypaste
      handle /copypaste/* {
        reverse_proxy localhost:3923
      }
    '';
  };


  networking.firewall.allowedTCPPorts = [ 80 443 ];

}
