 
{config, lib, pkgs, pkgs-unstable,inputs, ...}:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget


  services.desktopManager.plasma6.enable = true;

  programs.firefox.enable = true;          # Install firefox.
  services.logmein-hamachi.enable = true; # Hamachi servies
  programs.haguichi.enable = true;        # Hamachi client

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
    cmake meson cpio
    base16-schemes
    wayland-utils
    vulkan-tools
    rar
    zip
    unzip
    wget
    fzf
    curl
    busybox
    nano
    rnnoise-plugin
    brightnessctl
    themix-gui
    jdk23
    inputs.zen-browser.packages."${system}".default #zenbrowser temp flake
    imagemagick
    micro
    pywal16

  #System App
    ranger
    blueman
    pavucontrol
    kdePackages.partitionmanager
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
    python312Packages.kde-material-you-colors

  #User App
    mission-center
    easyeffects
    keepassxc
    mpv
    kate
    freeoffice
    onlyoffice-desktopeditors
    airshipper
    alacritty
    kitty
    amule
    calibre

    protonup-qt
    protontricks
	lutris
 	steamtinkerlaunch
 	
  #THEMING
    libsForQt5.qt5ct
    kdePackages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    materia-kde-theme
    catppuccin-cursors.latteLight

    pywalfox-native #firfox-pywal serve per add-on 
  ])
 ++
  #unstable packages
    (with pkgs-unstable; [
    mcontrolcenter
    rofi-wayland 
    fastfetch
    vesktop
    r2modman
    heroic
    prismlauncher
    hellwal


    (discord.override {
          # remove any overrides that you don't want
         withOpenASAR = true;
         withVencord = true;
        })
 ]);


  #steamsettings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
    };

  #Fonts
    fonts.fontDir.enable = true;
    fonts.packages = with pkgs; [
	nerdfonts
        scientifica
      ];

  services.flatpak.enable = true;
  services.flatpak.packages = [
   "org.upscayl.Upscayl"
   "org.jdownloader.JDownloader"
   "net.waterfox.waterfox" 
   "net.retrodeck.retrodeck"
   "io.github.ryubing.Ryujinx"
   "com.obsproject.Studio"
   "org.kde.krita"
   "org.DolphinEmu.dolphin-emu"
   "tv.kodi.Kodi"
    ];
}

