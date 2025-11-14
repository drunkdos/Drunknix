{ config, lib, pkgs, pkgs-unstable, ... }:
{
 services.homer = {
 enable = true;
 virtualHost.caddy.enable = true;
 };
 }
