{config, lib, pkgs, pkgs-unstable,inputs, ...}:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget

programs.animesaturn-downloader.enable = true;

  services.desktopManager.plasma6.enable = true;

  programs.firefox.enable = true;          # Install firefox.
  programs.dconf.enable = true;
  security.rtkit.enable = true; 

  programs.kdeconnect = {
      enable = true;
   };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };


  environment.systemPackages = (
  with pkgs; [
  #stable packages

    inputs.zen-browser.packages."${system}".default #zenbrowser flake


  #System App
    bluejay
    pulseaudio #FOR COMMAND
    lxqt.pavucontrol-qt #FOR GUI
    kdePackages.partitionmanager
    kdePackages.kirigami
    kdePackages.dolphin
    kdePackages.kservice	libsForQt5.kservice
    kdePackages.kio-admin
    kdePackages.ark
    kdePackages.knewstuff
    kdePackages.qtmultimedia

  #User App
    keepassxc
    mpv
    kdePackages.kate
    kitty
    amule
    chromium

  #THEMING
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
  ])
 ++
  #unstable packages
    (with pkgs-unstable; [
    vesktop
 ]);



  #Fonts
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
	nerd-fonts.departure-mono
      ];

}

