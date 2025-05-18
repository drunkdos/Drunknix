{ config, pkgs, inputs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = rofi;

    extraConfig = {
      modi = "drun,filebrowser";
      font = "Jetbrains Mono Nerdfont";
      show-icons = true;
      disable-history = true;
      hover-select = true;
      display-drun: "   Apps ";
      display-run: "   Run ";
      display-window: " 󰕰  Window";
      icon-theme = "Fluent-dark";
      terminal = "kitty";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };
  };
}
