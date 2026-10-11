{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{
  programs.craftapps = {
    enable = true;
    apps.photocraft.enable = true;
    apps.vectorcraft.enable = true;
    apps.wordcraft.enable = true;
    apps.deckcraft.enable = true;
    apps.gridcraft.enable = true;
    apps.cadcraft.enable = true;
  };
}
