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
      ];
    };

    programs.gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--expose-wayland"
      ];
    };


    environment.systemPackages = ( with pkgs; [
    protonup-qt
    protontricks
    wine
    wine64
    winetricks
    lutris
    steamtinkerlaunch
    airshipper


      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    r2modman
    heroic
    prismlauncher
    sgdboop
      ]);



  services.flatpak.packages = [
   "net.retrodeck.retrodeck"
   "io.github.ryubing.Ryujinx"
   "org.DolphinEmu.dolphin-emu"
  ];
}
