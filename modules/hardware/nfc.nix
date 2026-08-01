{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{
    environment.systemPackages = ( with pkgs; [
    acsccid
    pcsclite
    libnfc
    ])

 ++ (with pkgs-unstable; [
  #unstable packages

    ]);

}
