{ config, pkgs, ... }:

{
  imports = [
    ./modules/programs/programming/neovim
    ./modules/programs/programming/git
    ./modules/programs/programming/emacs
    ./modules/programs/terminal/zsh
    ./modules/programs/terminal/zoxide
    ./modules/programs/media/mpv
    ./modules/xresources
    ./modules/programs/browser/vieb
    ./modules/programs/windowmanager/bspwm
    ./modules/services/kdeconnect
    ./modules/services/lorri
    ./modules/services/security
    ./modules/services/syncthing
    # ./modules/windowmanager/xmonad
    ./modules/fonts
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = import ./packages.nix pkgs;

  nixpkgs.overlays = [];

  home.sessionVariables = {
    JAVA_HOME="$HOME/.nix-profile/lib/openjdk";
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "konsole";
    BROWSER = "brave";
    STUDENTNUMMER = builtins.readFile ./studentnummer.txt;
  };
  xsession.initExtra = ''
    xdg-settings set default-web-browser brave-browser.desktop
  '';

  xsession.scriptPath = ".hm-xsession";

  programs.home-manager.enable = true;
  home.username = "silas";
  home.homeDirectory = "/home/silas";
  home.stateVersion = "21.03";
}
