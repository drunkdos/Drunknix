{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  # Enable Hyprland
  programs.niri = {
     enable = true;
    };


  environment.systemPackages = with pkgs; [
  ];

}
