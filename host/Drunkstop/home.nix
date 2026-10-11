{inputs, config, home-manager,stylix, pkgs, lib, ... }:

{
  home.username = "drunk";
  home.homeDirectory = "/home/drunk";
  imports = [
   ../../home/style/stylix.nix
   ../../home/app/kitty.nix
   ../../home/app/rofi.nix
   ../../home/wm/noctalia.nix

  ];

  home.stateVersion = "24.05"; # Do not change.

  home.packages = with pkgs; [
  ];

  home.sessionVariables = { };

  programs.git = {
    enable = true;
    settings.user= {
      name  = "drunkdos";
      email = "drunkdos.97@gmail.com";
    };
  };



   xdg.portal = {
    enable = true;
    extraPortals =
      with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];

    config = {
      common = {
        "org.freedesktop.impl.portal.FileChooser" = "kde";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

