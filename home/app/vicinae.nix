{ config, pkgs, inputs, lib, ... }:
{
    services.vicinae = {
        enable = true; # default: false
        autoStart = true; # default: true
    };
}
