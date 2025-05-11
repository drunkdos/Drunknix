{ config, lib, pkgs, pkgs-unstable, ... }:
{  services.displayManager.sddm= {
  enable = true;
  wayland.enable = true;
  theme = "sddm-astronaut-theme";
  };

  services.displayManager.sddm.package = lib.mkDefault pkgs.kdePackages.sddm;

environment.systemPackages = [(
pkgs.sddm-astronaut.override {
  themeConfig = {
    "Font" = "JetBrainsMono";
    "FontSize" = "12";
#    "Background" = "${./wallpaper.png}";
    "FormPosition"="left";

  };
}
)];
}
