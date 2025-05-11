# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{inputs, config, lib, pkgs, pkgs-unstable, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/pipewire.nix
      ../../modules/nvidia-offload.nix
      ../../modules/stylix.nix
      ../../modules/hypland.nix
      ../../modules/packages.nix
      ../../modules/zsh.nix
      ../../modules/sddm.nix
      ];
 
  #HDD
  fileSystems."/data" = { 
      device = "/dev/disk/by-uuid/76445cd8-7a2c-4613-84d2-1452d351f3fc";
      fsType = " btrfs";
    };


  #Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


 #nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  nix = {
   	gc = {
   	    automatic = true;
  	    dates = "weekly";
  	    persistent = true;
  	    options = "--delete-older-than 15d";
        };
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

 #Portals
  xdg.portal = {
  enable = true;
  extraPortals = with pkgs; [
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    kdePackages.xdg-desktop-portal-kde
    ];
  config = {
    # example with hyprland
    hyprland.preferred = [ "hyprland" "gtk" ];
  };
};


  hardware.bluetooth.enable = true;

  networking.hostName = "Drunk_nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 4662 ];
      allowedUDPPorts = [ 4672 ];
      };
    };


  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.drunk = {
    isNormalUser = true;
    description = "Drunkdos";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
