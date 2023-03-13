{ ... }:

{
  imports = [
    ./modules/programs/programming/neovim
    ./modules/programs/programming/git
    ./modules/programs/terminal/zsh
    ./modules/programs/terminal/zoxide
    ./modules/programs/media/mpv
    ./modules/programs/ranger
    ./modules/programs/windowmanager/bspwm
    ./modules/programs/plover
    ./modules/programs/tmux
    ./modules/programs/emacs
    ./modules/xresources
    ./modules/services/lorri
    ./modules/services/security
    ./modules/services/sxhkd
    ./modules/services/autokey
    ./modules/services/rclone
    ./modules/fonts
    ./modules/services/syncthing
    ./modules/haskell/default.nix
    ./packages.nix
  ];

  programs.go.enable = true;

  home.file = {
    ".background-image/background.png".source = ./nix1.png;
  };

  home.sessionVariables = {
    # JAVA_HOME = "$HOME/.nix-profile/lib/openjdk";
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
