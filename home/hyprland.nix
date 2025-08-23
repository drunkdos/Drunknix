{ config, lib, pkgs, inputs, userSettings, stylix, ... }:
{

 imports = [
   ./app/rofi.nix
   ./app/fuzzel.nix
  ];

#  services.mako = {
#   enable = false;
#   settings = {
#     actions = true;
#     anchor = "top-right";
#     border-size= 2;
#     border-radius = 8;
#     default-timeout = 10;
#     icons = true;
#     ignore-timeout = false;
#     layer = "top";
#     margin = 8;
#     markup = true;
#     };
#  };

programs.wlogout = {
  enable = true;
 };
 }
