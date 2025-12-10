{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{

boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

 services.flatpak.overrides = {
    global = {
      # Force Wayland by default
      Context.filesystems = [
        "/nix/store:ro" # Expose Nix
        "~/.icons:ro"
      ];
      Environment = {
        # Fix un-themed cursor in some Wayland apps
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons:~/.icons:ro";

      };
    };
   };
services.flatpak.enable = true;
  services.flatpak.packages = [
   "org.upscayl.Upscayl"
   "org.jdownloader.JDownloader"
   "net.waterfox.waterfox"
   "com.obsproject.Studio"
   "org.kde.krita"
   "tv.kodi.Kodi"
   "org.onlyoffice.desktopeditors"
   "com.github.zocker_160.SyncThingy"
   "md.obsidian.Obsidian"
    ];
}
