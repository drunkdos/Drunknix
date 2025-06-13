{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
     enable = true;
     withUWSM = true;
     xwayland.enable = true; 
#    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
#    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
	};
#  environment.sessionVariables.NIXOS_OZONE_WL = "1";
#  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

 
  environment.systemPackages = with pkgs; [
    pyprland
    hyprpicker
    hyprcursor
    hyprpaper
    waypaper
    hyprlock
    hypridle
    hyprpolkitagent
    hyprshot
    waybar
    wl-clipboard
    clipse
  ];

}
