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
    wineWow64Packages.waylandFull #a quanto pare la miglior versione FullWayland
    winetricks
    lutris
    steamtinkerlaunch
    airshipper
    gzdoom
    prismlauncher


      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    r2modman
    heroic
    olympus #celeste-modmanager
    sgdboop
      ]);



  services.flatpak.packages = [
   "net.retrodeck.retrodeck"
   "io.github.ryubing.Ryujinx"
   "org.DolphinEmu.dolphin-emu"
   "sh.ppy.osu"
  ];
}
