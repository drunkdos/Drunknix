{ lib, pkgs, inputs, userSettings, stylix,... }:

let
  themePath = "../../../themes/"+userSettings.theme+"/"+userSettings.theme+".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");
in

{

  services.displayManager.sddm= {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    };

  services.displayManager.sddm.package = lib.mkDefault pkgs.kdePackages.sddm;

  environment.systemPackages = [(
  pkgs.sddm-astronaut.override {
    themeConfig = {
      "Font" = "JetBrainsMono";
      "FontSize" = "12";
      "Background" = pkgs.fetchurl {
   url = backgroundUrl;
   sha256 = backgroundSha256;
  };
      "FormPosition"="left";

  };
}
)];
}
