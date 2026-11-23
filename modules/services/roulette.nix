{ inputs, ... }:

{
  imports = [ inputs.serie-roulette.nixosModules.default ];

  services.serieRoulette = {
    enable = true;
    port = 3000;
    host = "127.0.0.1";
    environmentFile = "/run/secrets/serie-roulette.env";
  };
}
