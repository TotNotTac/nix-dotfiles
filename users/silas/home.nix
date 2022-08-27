{ config, pkgs, unstable, ... }:

{
    imports = [
        ./modules/programs/programming/neovim
        ./modules/programs/programming/git
        ./modules/programs/terminal/zsh
        ./modules/programs/terminal/zoxide
        ./modules/programs/media/mpv
        ./modules/xresources
        ./modules/programs/windowmanager/bspwm
        ./modules/services/kdeconnect
        ./modules/services/lorri
        ./modules/services/security
        ./modules/services/sxhkd
        ./modules/fonts
        ./modules/programs/plover
        ./modules/programs/emacs
        ./modules/services/syncthing
        ./packages.nix
    ];

    # nixpkgs.config.allowUnfree = true;

    nixpkgs.overlays = [];

    home.sessionVariables = {
        JAVA_HOME="$HOME/.nix-profile/lib/openjdk";
        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "brave";
        STUDENTNUMMER = builtins.readFile ./studentnummer.txt;
        RANGER_LOAD_DEFAULT_RC = "FALSE";
        # LD_LIBRARY_PATH="/home/silas/.nix-profile/lib";
        # LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib/:/run/opengl-driver/lib/";
        TERMINAL = "konsole";
    };
    xsession.initExtra = ''
        xdg-settings set default-web-browser brave-browser.desktop
        #sxhkd &
    '';

    xsession.scriptPath = ".hm-xsession";

    programs.home-manager.enable = true;
    home.username = "silas";
    home.homeDirectory = "/home/silas";

    home.stateVersion = "22.05";
}
