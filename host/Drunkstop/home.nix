{inputs, config, home-manager,stylix, pkgs, lib, ... }:

{
  home.username = "drunk";
  home.homeDirectory = "/home/drunk";
  imports = [
   ../../home/style/stylix.nix
   ../../home/hyprland.nix
   ../../home/app/kitty.nix
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

