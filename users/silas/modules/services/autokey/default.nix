{ config, lib, pkgs, ... }:

{
    home.packages = [
        pkgs.autokey
    ];

    systemd.user.services."autokey" = {
        Unit.Description = "Autokey service";
        Install.WantedBy = [ "graphical-session-target" ];
        Service = {
            Type = "Simple";
            ExecStart = "${pkgs.autokey}/bin/autokey";
            Restart = "always";
            RestartSec = "5";
        };
    };
}
