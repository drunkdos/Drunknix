{ config, lib, pkgs, pkgs-unstable, ... }:

{
 services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "drunk";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
