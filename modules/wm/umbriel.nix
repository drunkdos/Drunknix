{ inputs, config, pkgs, pkgs-unstable, ... }:

{

imports = [ inputs.umbriel.nixosModules.default
            inputs.noctalia.nixosModules.default
            ];
programs.umbriel.enable = true;


  programs.noctalia = {
    enable = true;

    # Enables NetworkManager, Bluetooth, UPower, and a power profile service.
    recommendedServices.enable = true;
  };

  nix.settings = {
  extra-substituters = [ "https://noctalia.cachix.org" ];
  extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];

  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];



}
