{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{

  environment.systemPackages =
  ( with pkgs; [
    android-tools
    qtscrcpy
    droidcam
      ])
 ++ (with pkgs-unstable; [
    revanced-cli
      ]);

}
