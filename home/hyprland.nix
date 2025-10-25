{ config, lib, pkgs, inputs, userSettings, stylix, ... }:
{

 imports = [
   ./app/rofi.nix
  ];


programs.wlogout = {
  enable = true;
 };
 }
