{ config, lib, ... }:

let
  themeFile = import ./vesktopTemplate.nix {
    inherit (config.lib.stylix) colors;
    inherit (config.stylix) fonts;
  };
in

{
  options.stylix.targets.MYvesktop.enable =
    config.lib.stylix.mkEnableTarget "Vesktop" true;

  config =
    lib.mkIf (config.stylix.enable && config.stylix.targets.MYvesktop.enable)
      {
        xdg.configFile."vesktop/themes/stylix.theme.css".text = themeFile;
      };
}
