{inputs, config, userSettings, lib, pkgs, pkgs-unstable, ... }:
 {
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/home/${userSettings.username}/Drunknix";
  };

    nix = {
    optimise = {
    	automatic = true;
    	dates = ["Mon *-*-* 00:00:00"];
        };
  };

   system.autoUpgrade = {
   enable = true;
   flake = inputs.self.outPath;
   dates = "weekly";
   persistent = true;
   };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
  ];
}
