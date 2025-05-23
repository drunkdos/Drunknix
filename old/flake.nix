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
  outputs = { self, nixpkgs, nixpkgs-unstable, hyprland,
               home-manager, stylix, nix-flatpak,  ... }@inputs :

  let
	system = "x86_64-linux";
	commonArgs = {inherit system; config.allowUnfree= true;};
	pkgs = import nixpkgs (commonArgs // {overlays = [inputs.hyprpanel.overlay];});
	pkgs-unstable = import nixpkgs-unstable commonArgs;
        lib = nixpkgs.lib;
	username = "drunk"; 
  in 

   {
    nixosConfigurations.Drunknix = lib.nixosSystem {
       specialArgs = { inherit inputs; };
        inherit pkgs;
        modules = [
         ./configuration.nix
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "diocaneimpestato";
            home-manager.useUserPackages = true;
            home-manager.users.drunk = { imports =[ ./home.nix];};
            home-manager.extraSpecialArgs = {inherit inputs;};
            }
           ];
          
          
        specialArgs = { inherit pkgs-unstable;  }; 
      };
    };
  }

