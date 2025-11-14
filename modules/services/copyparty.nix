{ config, lib, pkgs, pkgs-unstable, ... }:

{
     networking.firewall = {
       allowedTCPPorts = [ 3923 ];
       allowedUDPPorts = [ 3924 ];
       };
  environment.systemPackages = [ pkgs.copyparty ];
  services.copyparty = {
    enable = true;
  # the user to run the service as
    user = "drunk";
  # the group to run the service as
    group = "copyparty";
  # directly maps to values in the [global] section of the copyparty config.
  # see `copyparty --help` for available options
    settings = {
      i = "127.0.0.1";
    # use lists to set multiple values
      p = [ 3923 3924 ];
      rproxy = 1;
      "rp-loc" = "/copyparty/";
    # use booleans to set binary flags
      no-reload = true;
    # using 'false' will do nothing and omit the value when generating a config
      ignored-flag = false;
    };

   # create users
   accounts = {
     # specify the account name as the key
     drunk.passwordFile = "/home/drunk/.ssh/drunk";
     orbi.passwordFile = "/home/drunk/.ssh/orbi";
   };

  # create a group
  groups = {
    # users "ed" and "k" are part of the group g1
    g1 = [ "drunk" ];
  };

  # create a volume
  volumes = {
    # create a volume at "/" (the webroot), which will
    "/shared" = {
      # share the contents of "/srv/copyparty"
      path = "/home/copyparty/shared";
      # see `copyparty --help-accounts` for available options
      access = {
        # everyone gets read-access, but
        r = "*";
        # users "ed" and "k" get read-write
        rw = [ "drunk" "orbi" ];
      };
      # see `copyparty --help-flags` for available options
      flags = {
        # "fk" enables filekeys (necessary for upget permission) (4 chars long)
        fk = 4;
        # scan for new files every 60sec
        scan = 60;
        # volflag "e2d" enables the uploads database
        e2d = true;
        # "d2t" disables multimedia parsers (in case the uploads are malicious)
        d2t = true;
        # skips hashing file contents if path matches *.iso
        nohash = "\.iso$";
      };
    };
    "/hidden" = {
      # share the contents of "/srv/copyparty"
      path = "/home/copyparty/hidden";
      # see `copyparty --help-accounts` for available options
      access = {
        # everyone gets read-access, but
        r = "drunk";
        # users "ed" and "k" get read-write
        rw = [ "drunk" ];
      };
      # see `copyparty --help-flags` for available options
      flags = {
        # "fk" enables filekeys (necessary for upget permission) (4 chars long)
        fk = 4;
        # scan for new files every 60sec
        scan = 60;
        # volflag "e2d" enables the uploads database
        e2d = true;
        # "d2t" disables multimedia parsers (in case the uploads are malicious)
        d2t = true;
        # skips hashing file contents if path matches *.iso
        nohash = "\.iso$";
      };
    };
  };
  # you may increase the open file limit for the process
  openFilesLimit = 8192;
};
}
