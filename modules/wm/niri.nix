{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  imports =
    [./waylandcommon.nix
    ];

  # Enable Niri
  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
   };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

}
