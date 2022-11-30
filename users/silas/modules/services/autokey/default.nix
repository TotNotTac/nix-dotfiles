{ pkgs, ... }:

{
    home.packages = [
        pkgs.autokey
    ];

    systemd.user.services."autokey" = {
        Unit.Description = "Autokey service";
        Install.WantedBy = [ "graphical-session-target" ];
        Service = {
            Type = "simple";
            ExecStart = "${pkgs.autokey}/bin/autokey";
            Restart = "always";
            RestartSec = "5";
        };
    };
}
