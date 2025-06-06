{ config, lib, pkgs, inputs, userSettings, stylix, ... }:
{

 imports = [
   ./rofi.nix
   ./fuzzel.nix
  ];

 services.dunst.enable = true;
}
