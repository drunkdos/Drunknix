{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  imports =
    [./waylandcommon.nix
    ];

  # Enable Niri
  programs.niri = {
     enable = true;
    };


  environment.systemPackages = with pkgs; [
  xwayland-satellite
  ];

}
