{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{
 #steamsettings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
      pkgs.steamtinkerlaunch
      ];
    };

    environment.systemPackages = ( with pkgs; [
    protonup-qt
    protontricks
    wine-wayland
    winetricks
    lutris
    steamtinkerlaunch
    airshipper
    gzdoom
    prismlauncher
    sgdboop


      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    r2modman
    heroic
    olympus #celeste-modmanager
      ]);



  services.flatpak.packages = [
   "net.retrodeck.retrodeck"
   "io.github.ryubing.Ryujinx"
   "org.DolphinEmu.dolphin-emu"
   "sh.ppy.osu"
  ];
}
