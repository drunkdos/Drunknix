{ conif,pkgs,stylix, ... }:

{
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.polarity = "dark"; 
#  stylix.homeManagerIntegration.autoImport = true;
  
#  home-manager.sharedModules = [{ stylix.targets.xyz.enable = false;}];
# stylix.targets.qt.enable = true;
#  stylix.targets.hyprland.hyprpaper.enable = true;

  stylix.cursor = {
          package=pkgs.catppuccin-cursors.latteLight;
          name="catppuccin-latte-light-cursors";
          size=30; 
          };

stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts;
      name ="JetBrainsMonoNerdFontMono-Regular";
    };
    sansSerif = {
      package = pkgs.nerdfonts;
      name ="JetBrainsMonoNerdFont-Regular";
    };
    serif = {
      package = pkgs.nerdfonts;
      name ="JetBrainsMonoNerdFont-Regular";
    };
 };

 stylix.image = ./wallpaper.png;


# stylix.base16Scheme = ./Pywal/base16.yaml;
# stylix.base16Scheme = ./Pywal/omox.yaml;
# stylix.base16Scheme = ./material.yaml;
 stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-darker.yaml";
 
 stylix.opacity.terminal = 0.2;
}


