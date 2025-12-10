{ config, lib, pkgs, ... }:

let
  # --- Definizione del Pacchetto ---
  pname = "animesaturn-downloader";
  version = "0.2.2"; # Controlla sempre l'ultima versione

  animesaturn-pkg = pkgs.buildGoModule {
    inherit pname version;

    src = pkgs.fetchFromGitHub {
      owner = "MrRainbow0704";
      repo = "animesaturnDownloaderGo";
      rev = "v${version}";
      # Hash provvisorio per i sorgenti (Nix ti darà quello vero al primo errore)
      hash = "sha256-UzxweZkD+d8a19xkqTGQrVturqxcbfKfNWAIt3sTp9A=";
    };
    subPackages = [ "cmd/animesaturn-downloader" ];

    # Rimuovi il codice Go della GUI dalla fase di build
    excludedPackages = [ "cmd/animesaturn-downloader-gui" ];
    # Hash provvisorio per le dipendenze Go
    vendorHash = "sha256-Usbm4vKbySlTJaLEq1k38bgFkOU/d3gweWVXZDFtAWo=";

    doCheck = false;

    meta = with lib; {
      description = "Un modo semplice per scaricare anime in italiano (CLI)";
      homepage = "https://github.com/MrRainbow0704/animesaturnDownloaderGo";
      license = licenses.gpl3;
      mainProgram = "animesaturn-downloader";
    };
  };

  cfg = config.programs.animesaturn-downloader;

in {
  # --- Opzioni del Modulo ---
  options.programs.animesaturn-downloader = {
    enable = lib.mkEnableOption "Abilita animesaturn-downloader CLI";
  };

  # --- Configurazione (Cosa succede se enable = true) ---
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ animesaturn-pkg ];
  };
}
