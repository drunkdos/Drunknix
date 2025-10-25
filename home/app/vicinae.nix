{ config, pkgs, inputs, lib, stylix, colors,...}:

let

    inherit (config.lib.stylix) colors;
    inherit (config.stylix) fonts;
in
{
nix.settings = {
  extra-substituters = [ "https://vicinae.cachix.org" ];
  extra-trusted-public-keys = [ "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" ];
  };

  services.vicinae = {
    enable = true; # default: false
    autoStart = true; # default: true
    settings = {
      closeOnFocusLoss = false;
      faviconService = "googe"; # twenty | google | none
      font = {
         normal = "JetBrainsMono Nerd Font";
         size = 10;
         };
      popToRootOnClose = false;
      rootSearch.searchFiles = false;
      theme = {
         name = "stylix";
         iconTheme = "Papirus";
         };
      window = {
        csd = true;
        opacity = 0.95;
        rounding = 10;
      };
   };

  };

#   xdg.configFile."vicinae/vicinae.json".text = ''
#     {
#       "closeOnFocusLoss": false,
#       "faviconService": "google",
#       "font": {
#         "normal": "JetBrainsMono Nerd Font",
#         "size": 10
#       },
#       "popToRootOnClose": false,
#       "rootSearch": {
#         "searchFiles": true
#       },
#       "theme": {
#         "iconTheme": "Papirus",
#         "name": "stylix.json"
#       },
#       "window": {
#         "csd": true,
#         "opacity": 0.95,
#         "rounding": 10
#       }
#     }
#   '';

  xdg.configFile."vicinae/themes/stylix.json".text = pkgs.lib.generators.toJSON {} {
    version = "1.0.0";
    appearance = "dark";
    icon = "./x.png";
    name = "stylix";
    description = "autogen";
    palette = {
      background = colors.withHashtag.base00;
      foreground = colors.withHashtag.base07;
      blue = colors.withHashtag.base0B;
      green = colors.withHashtag.base0A;
      magenta = colors.withHashtag.base0D;
      orange = colors.withHashtag.base08;
      purple = colors.withHashtag.base0E;
      red = colors.withHashtag.base09;
      yellow = colors.withHashtag.base0C;
      cyan = colors.withHashtag.base0F;
      };
  };
}
