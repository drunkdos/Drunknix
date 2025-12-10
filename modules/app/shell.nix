{ config, lib, pkgs, pkgs-unstable, ... }:
{
# enable zsh and oh my zsh
users.defaultUserShell = pkgs.fish;

programs.fish.enable = true;

environment.systemPackages = ( with pkgs; [
    clock-rs
    btop powertop
    caligula #BootableUSB
    wayland-utils
    vulkan-tools
    libnotify
    rar zip unzip
    wget
    fzf #search
    curl
    micro-full
    brightnessctl
    jdk25
    pywal16
      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    yt-dlp
    fastfetch
    gowall #imageprocessing
    yazi
    termusic
      ]);
}
