{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{
 #steamsettings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
    };


    environment.systemPackages = ( with pkgs; [
    protonup-qt
    protontricks
    lutris
    steamtinkerlaunch
    airshipper


      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    r2modman
    heroic
    prismlauncher

      ]);
}


  services.flatpak.packages = [
   "net.retrodeck.retrodeck"
   "io.github.ryubing.Ryujinx"
   "org.DolphinEmu.dolphin-emu"
  ];
}
