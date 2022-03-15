{ config, pkgs, ... }:

{
    imports = [
        ./modules/programs/programming/neovim
        ./modules/programs/programming/git
        # ./modules/programs/programming/emacs
        ./modules/programs/terminal/zsh
        ./modules/programs/terminal/zoxide
        ./modules/programs/media/mpv
        ./modules/xresources
        ./modules/programs/windowmanager/bspwm
        ./modules/services/kdeconnect
        ./modules/services/lorri
        ./modules/services/security
        ./modules/services/syncthing
        ./modules/services/sxhkd
        # ./modules/windowmanager/bspwm
        ./modules/fonts
        ./modules/python
    ];

    nixpkgs.config.allowUnfree = true;

    home.packages = import ./packages.nix pkgs;

    nixpkgs.overlays = [];

    home.sessionVariables = {
        JAVA_HOME="$HOME/.nix-profile/lib/openjdk";
        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "brave";
        STUDENTNUMMER = builtins.readFile ./studentnummer.txt;
        LD_LIBRARY_PATH="/home/silas/.nix-profile/lib";
        # LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/";
    };
    xsession.initExtra = ''
        xdg-settings set default-web-browser brave-browser.desktop
        sxhkd &
    '';

    xsession.scriptPath = ".hm-xsession";

    programs.home-manager.enable = true;
    home.username = "silas";
    home.homeDirectory = "/home/silas";
    home.stateVersion = "21.03";
}
