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
