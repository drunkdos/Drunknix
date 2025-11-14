{ inputs, config, pkgs, pkgs-unstable, ... }:

{


 environment.systemPackages = with pkgs; [
    waypaper
    waybar
    hyprlock
    swaybg #hyprpaper not work so good
    wl-clipboard
    clipse
    wayland-logout
    swaynotificationcenter
    hyprpolkitagent
    hypridle
  ];

}
