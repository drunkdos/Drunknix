{ inputs, config, pkgs, pkgs-unstable, ... }:

{
 environment.systemPackages = with pkgs; [
    kdePackages.polkit-kde-agent-1
    waypaper
    waybar
    hyprlock
    swaybg #hyprpaper not work so good
    wl-clipboard
    clipse
    wayland-logout
    swaynotificationcenter
  ];

}
