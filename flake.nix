{
  description = "DrunkNix flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
   # home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix = {
      url = "github:danth/stylix/release-24.11";
#      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
     };

     nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.2";

     hyprland.url = "github:hyprwm/Hyprland";
     hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

     zen-browser.url = "github:0xc000022070/zen-browser-flake";
};
  outputs = { self, nixpkgs, nixpkgs-unstable, hyprland, home-manager, stylix, nix-flatpak,  ... }@inputs :

  let
#systemSettings
  systemSettings = {
   	system = "x86_64-linux";
   	hostname = "Drunknix";
   	};
#userSettings
  userSettings = rec {
  	username = "drunk";
  	name = "Drunkdos";
  	theme = "everforest";
  	font = "JetBrainsMonoNerdFont-Regular";
  	fontPkg = pkgs.nerdfonts;
  };

#     pkgs = import nixpkgs commonArgs;
#	pkgs = import nixpkgs (commonArgs // {
#    overlays = [inputs.hyprpanel.overlay];});


  pkgs = import nixpkgs {
     system = systemSettings.system;
     config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        };
    };

	pkgs-unstable = import nixpkgs-unstable{
	 system = systemSettings.system;
     config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        };};

	lib = nixpkgs.lib;

  in

   {
    nixosConfigurations.Drunknix= lib.nixosSystem {
       modules = [
          (./. + "/host" + ("/" + systemSettings.hostname) + "/configuration.nix")
          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "diocaneimpestato";
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = { imports =[ (./. + "/host" + ("/" + systemSettings.hostname) + "/home.nix")];};
            home-manager.extraSpecialArgs = {
            inherit inputs;
            inherit userSettings;};
            }
           ];
        specialArgs = {
        inherit inputs;
        inherit systemSettings;
        inherit userSettings;
        inherit pkgs-unstable;  };
      };
    };
  }

