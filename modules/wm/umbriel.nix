{ inputs, config, pkgs, pkgs-unstable, ... }:

{

imports = [ inputs.umbriel.nixosModules.default ];
programs.umbriel.enable = true;


}
