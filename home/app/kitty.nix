{ config, pkgs, inputs, lib, stylix,... }:
{
  programs.kitty = {
  enable = true;
  package = pkgs.kitty;
  settings = {
    cursor_shape = "underline";
    };
  };
}
