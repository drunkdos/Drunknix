{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{
  services.flatpak.enable = true;
  services.flatpak.packages = [
   "org.upscayl.Upscayl"
   "org.jdownloader.JDownloader"
   "net.waterfox.waterfox"
   "com.obsproject.Studio"
   "org.kde.krita"
   "tv.kodi.Kodi"
    ];
}
