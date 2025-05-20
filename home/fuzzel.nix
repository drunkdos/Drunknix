 { config, lib, stylix,... }:
let
  opacity = lib.toHexString (builtins.ceil (config.stylix.opacity.popups * 255));
in
{
    programs.fuzzel = {
        enable = true;
        settings = {
          colors = with config.lib.stylix.colors; {
          background = "${base00-hex}${opacity}";
          text = "${base05-hex}ff";
          placeholder = "${base03-hex}ff";
          prompt = "${base05-hex}ff";
          input = "${base05-hex}ff";
          match = "${base0A-hex}ff";
          selection = "${base03-hex}ff";
          selection-text = "${base0D-hex}ff";
          selection-match = "${base0A-hex}ff";
          counter = "${base06-hex}ff";
          border = "${base0D-hex}ff";
        };

        main = {
          font = "${config.stylix.fonts.sansSerif.name}:size=16";
          dpi-aware = "no" ;
          icons-enabled= "yes" ;
          icons-theme= "Papirus" ;
          match-mode="fuzzy";

        };
      };
    };
}
