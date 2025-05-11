{ config, lib, pkgs, inputs, userSettings, ... }:

let
  themePath = "../../../themes"+("/"+userSettings.theme+"/"+userSettings.theme)+".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");
in
{

  home.file.".currenttheme".text = userSettings.theme;
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.polarity = themePolarity;
  stylix.image = pkgs.fetchurl {
    url = backgroundUrl;
    sha256 = backgroundSha256;
  };
  stylix.base16Scheme = ./. + themePath;

  stylix.fonts = {
    monospace = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    serif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    sansSerif = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
    emoji = {
      name = "Noto Emoji";
      package = pkgs.noto-fonts-monochrome-emoji;
    };

  };


   stylix.iconTheme = {
   # package = pkgs.catppuccin-papirus-folder.override {flavor = "macchiato"; accent = "teal"; };
     package  = pkgs.papirus-icon-theme.override{color = "deeporange";};
     dark = "Papirus-Dark"; # used
     light = "Papirus-Light"; # unused
    };

 stylix.cursor = {
       name = "catppuccin-latte-light-cursors";
       package = pkgs.catppuccin-cursors.latteLight;
       size = 30;
       };

 gtk.enable = true;
 gtk.iconTheme = {
       name = "Papirus-Dark";
       package  = pkgs.papirus-icon-theme.override{color = "deeporange";};
      };

   home.pointerCursor = {
   	gtk.enable = true;
    x11.enable = true;
    };
}
