{ config, lib, pkgs, pkgs-unstable, ... }:
{
# enable zsh and oh my zsh
users.defaultUserShell = pkgs.fish;

programs.fish.enable = true;

environment.systemPackages = ( with pkgs; [
    btop powertop #TASKMANAGER
    caligula #BootableUSB
    wayland-utils
    vulkan-tools
    libnotify
    rar zip unzip
    wget
    fzf
    curl
    micro-full
    brightnessctl
    jdk23
    pywal16
      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    fastfetch
    gowall
    rclone
    yazi
    neovim
      ]);
}
