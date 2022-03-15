{ config, lib, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        rofi
        sxhkd
    ];

    # systemd.user.services.sxhkd = {
    #     partOf=["graphical-session.target"];
    #     after=["graphical-session.target"];
    #     description = "Sxhkd";
    #     # bindsTo = ["display-manager.service"];
    #     serviceConfig = {
    #         # ExecStartPre=''${pkgs.sleep}/bin/sleep 2'';
    #         ExecStart = ''${pkgs.sxhkd}/bin/sxhkd'';
    #         ExecReload = ''/usr/bin/kill -SIGUSR1 $MAINPID'';
    #         Restart="always";
    #         RestartSec=2;
    #     };
    #     wantedBy = [ "default.target" ];
    # };
}
