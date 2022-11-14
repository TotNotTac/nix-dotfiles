{ config, pkgs, inputs, ... }:

{
    imports = [
        ./modules/programs/programming/neovim
        ./modules/programs/programming/git
        ./modules/programs/terminal/zsh
        ./modules/programs/terminal/zoxide
        ./modules/programs/media/mpv
        ./modules/programs/ranger
        ./modules/xresources
        ./modules/programs/windowmanager/bspwm
        ./modules/services/lorri
        ./modules/services/security
        ./modules/services/sxhkd
        ./modules/services/autokey
        ./modules/fonts
        ./modules/programs/plover
        ./modules/programs/emacs
        ./modules/services/syncthing
        ./packages.nix
    ];

    home.file = {
        ".background-image/background.webp".source = ./nix1.png;
    };

    home.sessionVariables = {
        JAVA_HOME="$HOME/.nix-profile/lib/openjdk";
        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "brave";
        STUDENTNUMMER = builtins.readFile ./studentnummer.txt;
        TERMINAL = "konsole";
    };

    xsession.initExtra = ''
        xdg-settings set default-web-browser brave-browser.desktop
    '';

    xsession.scriptPath = ".hm-xsession";

    programs.home-manager.enable = true;
    home.username = "silas";
    home.homeDirectory = "/home/silas";

    home.stateVersion = "22.05";
}
