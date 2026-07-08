{ inputs, config, pkgs, pkgs-unstable, ... }:


{
#fix Kde6 Process Outside Kde
  services.dbus.packages = [
    (pkgs.writeTextFile {
      name = "kded6-dbus-activation-file";
      text = ''
        [D-BUS Service]
        Name=org.kde.kded6
        SystemdService=plasma-kded6.service
      '';
      destination = "/share/dbus-1/services/org.kde.kded6.service";
    })
  ];
  systemd.user.services.plasma-kded6 = {
    overrideStrategy = "asDropin";
    serviceConfig = {
      ExecCondition = ''${pkgs.systemd}/lib/systemd/systemd-xdg-autostart-condition "KDE" ""'';
    };
  };
  systemd.user.services.plasma-kactivitymanagerd = {
    overrideStrategy = "asDropin";
    serviceConfig = {
      ExecCondition = ''${pkgs.systemd}/lib/systemd/systemd-xdg-autostart-condition "KDE" ""'';
    };
  };

  environment.systemPackages = with pkgs; [
    waypaper
    waybar
    hyprlock
    wl-clipboard
    clipse
    swaynotificationcenter
    hyprpolkitagent
    hypridle
    awww
    libxkbcommon
  ];

}
