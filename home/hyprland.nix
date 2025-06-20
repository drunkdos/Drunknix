{ config, lib, pkgs, inputs, userSettings, stylix, ... }:
{

 imports = [
   ./app/rofi.nix
   ./app/fuzzel.nix
  ];

 services.mako = {
  enable = true;
  settings = {
    actions = true;
    anchor = "top-right";
    border-size= 2;
    border-radius = 8;
    default-timeout = 0;
    icons = true;
    ignore-timeout = false;
    layer = "top";
    margin = 8;
    markup = true;

    };

 };

 }
