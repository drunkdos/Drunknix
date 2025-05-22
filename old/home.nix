	{inputs, config, home-manager,stylix, pkgs, lib, ... }:
		
{
  home.username = "drunk";
  home.homeDirectory = "/home/drunk";

  home.stateVersion = "24.05"; # Do not change.
 
  stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      };

  stylix.targets.gtk.flatpakSupport.enable = true;
  stylix.targets.fuzzel.enable = true;
 
  
  stylix.iconTheme = {
   # package = pkgs.catppuccin-papirus-folder.override {flavor = "macchiato"; accent = "teal"; };
     package  = pkgs.papirus-icon-theme.override{color = "deeporange";};
     dark = "Papirus-Dark"; # used
     light = "Papirus-Light"; # unused
    };

  gtk.enable = true;
  gtk.iconTheme = {
       name = "Papirus-Dark";
      # package = pkgs.catppuccin-papirus-folders.override {flavor = "macchiato"; accent = "teal";};
       package  = pkgs.papirus-icon-theme.override{color = "deeporange";};
      };
     
    
    stylix.cursor = {
       name = "catppuccin-latte-light-cursors";
       package = pkgs.catppuccin-cursors.latteLight;
       size = 30;
       };


   home.pointerCursor = {
   	gtk.enable = true;
    x11.enable = true;
#    name = "catppuccin-latte-light-cursors";
#    package = pkgs.catppuccin-cursors.latteLight;
#    size = 30
    };       
   
#  programs.gpg.enable = true;

#  services.gpg-agent.enable = true;


  home.packages = with pkgs; [
  ]; 

  home.sessionVariables = { };

  wayland.windowManager.hyprland = {
    plugins = [
#      inputs.hyprtasking.packages.${pkgs.system}.hyprtasking
    ];
  };

  programs.git = {
    enable = true;
    userName  = "drunkdos";
    userEmail = "drunkdos.97@gmail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

