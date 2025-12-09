{ config, lib, pkgs, inputs, userSettings, stylix, ... }:

let
  themePath = "../../../themes"+("/"+userSettings.theme+"/"+userSettings.theme)+".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");

in
{

  imports = [
   ./vesktop.nix

  ];

  home.file.".currenttheme".text = userSettings.theme;
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.polarity = themePolarity;
  stylix.image = pkgs.fetchurl {
    url = backgroundUrl;
    sha256 = backgroundSha256;
  };
  stylix.base16Scheme = ./. + themePath;

  stylix.targets = {
  fuzzel.enable = false;
  vesktop.enable = false;
  MYvesktop.enable = true;
  };

  stylix.fonts = {
    monospace = {
      name = (userSettings.font+"Mono");
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
      package = pkgs.noto-fonts-color-emoji;
    };
    sizes = {
    terminal = 11;
    };
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ''+config.stylix.image+''

    wallpaper = ,''+config.stylix.image+''

  '';

  home.file.".config/hypr/stylixwallpaper.conf".text = ''
    $wallpaper = ,''+config.stylix.image+''

  '';

  home.file = {
   ".config/stylix/color.css".source = config.lib.stylix.colors {
      template = builtins.readFile ./color.css.mustache;
      extension = ".css";

    };
    ".config/hypr/hyprcolor.conf".source = config.lib.stylix.colors {
      template = builtins.readFile ./hyprcolor.conf.mustache;
      extension = ".conf";
    };
     ".local/share/rofi/themes/rofi.rasi".source = config.lib.stylix.colors {
      template = builtins.readFile ./rofi.rasi.mustache;
      extension = ".rasi";
    };
     ".config/gowall/config.yml".source = config.lib.stylix.colors {
      template = builtins.readFile ./gowal-config.yml.mustache;
      extension = ".yml";
    };
     ".config/waybar/color.css".source = config.lib.stylix.colors {
      template = builtins.readFile ./waybar-colors.css.mustache;
      extension = ".css";
    };
   };

   stylix.iconTheme = {
   # package = pkgs.catppuccin-papirus-folder.override {flavor = "macchiato"; accent = "teal"; };
#     package  = pkgs.papirus-icon-theme.override{color = "deeporange";};
     dark = "breeze-dark"; # used
     light = "breeze-light"; # unused
    };

 stylix.cursor = {
       name = userSettings.cursor;
       package = userSettings.cursorPkg;
       size = userSettings.cursorSize;
       };

 gtk.enable = true;
# gtk.iconTheme = {
#       name = "Papirus-Dark";
#       package  = pkgs.papirus-icon-theme.override{color = "deeporange";};
#      };

   home.pointerCursor = {
    enable = true;
    name = userSettings.cursor;
    size = userSettings.cursorSize;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = userSettings.cursorSize;
      };
    };

   home.packages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ];
}
