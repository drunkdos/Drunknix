{ config, lib, pkgs, pkgs-unstable, ... }:

{
 services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
  };
  environment.systemPackages = [
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.jellyfin-ffmpeg
  ];
}
