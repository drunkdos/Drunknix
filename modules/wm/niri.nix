{ inputs, config, pkgs, pkgs-unstable, ... }:

{

  imports =
    [./waylandcommon.nix
    ];

  # Enable Niri
  programs.niri = {
    enable = true;
   };

  programs.uwsm.waylandCompositors.niri = {
    prettyName = "niri";
    comment = "niri compositor managed by UWSM";
    binPath = "/run/current-system/sw/bin/niri";
  };


  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

}
