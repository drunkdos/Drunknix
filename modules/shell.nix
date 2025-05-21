{ config, lib, pkgs, pkgs-unstable, ... }:
{
# enable zsh and oh my zsh
users.defaultUserShell = pkgs.fish;

programs.fish.enable = true;
 environment.systemPackages = ( with pkgs; [
    wayland-utils
    vulkan-tools
    rar zip unzip
    wget
    fzf
    curl
    micro-full
    rnnoise-plugin
    brightnessctl
    themix-gui
    jdk23
    imagemagick
    pywal16
      ])
 ++ (with pkgs-unstable; [
  #unstable packages
    fastfetch
    hellwal
    gowall
    rclone

      ]);
}
