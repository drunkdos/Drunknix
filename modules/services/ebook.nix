{ config, pkgs, pkgs-unstable, ... }:

  services.calibre-web = {
    enable = true;
    openFirewall = true;
    user = "drunkserver";
    group = "drunkserver";
  };
