{ config, lib, pkgs, ... }:

{
    xsession.windowManager.bspwm = {
        enable = true;

        monitors = {
            DisplayPort-0 = [ "discord" "3" ];
            HDMI-A-O = [ "1" "2" ];
        };

        #https://rycee.gitlab.io/home-manager/options.html#opt-xsession.windowManager.bspwm.rules

        extraConfig = builtins.readFile ./bspwmrc;

    };

    services.sxhkd = {
        enable = true;

        extraConfig = builtins.readFile ./sxhkdrc;
    };

    home.packages = with pkgs; [
        dmenu
        kitty
        libnotify
    ];

    home.sessionVariables = {
        TERMINAL = "kitty";
    };
}
