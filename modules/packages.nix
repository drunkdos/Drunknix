 
{config, lib, pkgs, pkgs-unstable,inputs, ...}:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget


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

    inputs.zen-browser.packages."${system}".default #zenbrowser temp flake


  #System App
    blueman
    pavucontrol
    kdePackages.partitionmanager
	mediawriter
    kdePackages.kirigami
    kdePackages.ktorrent
    kdePackages.dolphin
    kdePackages.kservice	libsForQt5.kservice
    kdePackages.kaccounts-providers
    kdePackages.kaccounts-integration
    kdePackages.kio-admin
    kdePackages.libkgapi
    kdePackages.ark
    kdePackages.knewstuff
    kdePackages.kio-gdrive
    kdePackages.qtmultimedia

  #User App
    better-control
    easyeffects
    keepassxc
    mpv
    kdePackages.kate
    freeoffice
    onlyoffice-desktopeditors
    kitty
    amule
    chromium

  #THEMING
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    catppuccin-cursors.latteLight
    themix-gui

    pywalfox-native #firfox-pywal serve per add-on
  ])
 ++
  #unstable packages
    (with pkgs-unstable; [
    mcontrolcenter
#    rofi-wayland
    vesktop
    anydesk
    rclone
 ]);



  #Fonts
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
    scientifica
      ];

}

