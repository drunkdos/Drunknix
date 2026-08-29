{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{
services.pcscd.enable = true;
services.pcscd.plugins = [ pkgs.acsccid ];

  boot.blacklistedKernelModules = [ "pn533_usb" ];

  services.neard= {
    enable = false;
    settings = {
        ConstantPoll = true;
        DefaultPowered = true;
        ResetOnError = true;
        };
    };

    environment.systemPackages = ( with pkgs; [
    ccid
    acsccid
    pcsclite
    pcsc-tools
    libnfc
    ])

 ++ (with pkgs-unstable; [
  #unstable packages

    ]);

}
