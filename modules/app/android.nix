{config, lib, pkgs, pkgs-unstable,inputs, ...}:

{

  programs.adb.enable = true;

  environment.systemPackages =
  ( with pkgs; [
    qtscrcpy
    droidcam
      ])
 ++ (with pkgs-unstable; [
    revanced-cli
      ]);

}
