{ config, pkgs, inputs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = lib.mkForce "rofi";
    plugins = with pkgs; [
      rofi-bluetooth
      rofi-emoji-wayland
      networkmanager_dmenu
    ];

    extraConfig = {
      modi = "run,drun,window";
      font = "Jetbrains Mono Nerdfont";
      show-icons = true;
      disable-history = false;
      hover-select = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window";
      display-Network= " 󰤨  Network";
      display-filebrowser= "   File";
      icon-theme = "breeze-dark";
      terminal = "kitty";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
      sidebar-mode = true;
    };
  };
 home.packages = with pkgs; [
      rofi-bluetooth
      rofi-emoji-wayland
  ];

}
