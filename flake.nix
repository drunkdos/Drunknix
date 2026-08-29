{
  description = "DrunkNix flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
   # home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix = {
      url = "github:danth/stylix/release-26.05";
#      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
     };

    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    niri.url = "github:sodiboo/niri-flake";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
#     vicinae.url = "github:vicinaehq/vicinae";
    copyparty.url = "github:9001/copyparty";

    umbriel.url = "github:noctalia-dev/umbriel";
};


  outputs = {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      stylix,
      nix-flatpak,
      copyparty,
      umbriel,
      #vicinae,
      ...
  }@inputs:


  let
#systemSettings
  systemSettings = {
   	system = "x86_64-linux";
   	hostname = "Drunkstop";
   	};
#userSettings
  userSettings = rec {
  	username = "drunk";
  	name = "Drunkdos";
  	theme = "tokyonight";
  	font = "JetBrainsMonoNerdFont";
  	fontPkg = pkgs.nerd-fonts.jetbrains-mono;
  	cursor = "graphite-light";
  	cursorPkg = pkgs.graphite-cursors;
  	cursorSize = 30;
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
    nixosConfigurations.${systemSettings.hostname}= lib.nixosSystem {
       modules = [
          (./. + "/host" + ("/" + systemSettings.hostname) + "/configuration.nix")
          ./modules/animesaturn.nix
          {nixpkgs.overlays = [
            inputs.niri.overlays.niri
            copyparty.overlays.default
            ];
          }
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          copyparty.nixosModules.default
          umbriel.nixosModules.default

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "diocaneimpestato";
            home-manager.useUserPackages = true;
            home-manager.users.${userSettings.username} = {
              imports =[
                (./. + "/host" + ("/" + systemSettings.hostname) + "/home.nix")
#                 vicinae.homeManagerModules.default
              ];
            };
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

