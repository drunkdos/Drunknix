{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{

  environment.systemPackages =
  ( with pkgs; [
    android-tools
    droidcam
      ])
 ++ (with pkgs-unstable; [
     qtscrcpy
      ]);

}
