{ config, lib, pkgs, pkgs-unstable, ... }:
{
    services.pufferpanel = {
        enable = true;
        extraGroups = ["drunkserver"];
        extraPackages = [ pkgs.jre ];
        environment = {
            PUFFER_WEB_HOST = ":8090";
            PUFFER_DAEMON_SFTP_HOST = ":5657";
            PUFFER_DAEMON_CONSOLE_BUFFER = "1000";
            PUFFER_DAEMON_CONSOLE_FORWARD = "true";
        };
    };
     networking.firewall = {
       allowedTCPPorts = [ 8090 ];
       };

    environment.systemPackages = with pkgs; [
        pufferpanel
        jre
    ];

}
