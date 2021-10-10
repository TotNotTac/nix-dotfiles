{ config, pkgs, ... }:

{
  imports = [
    ./modules/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = import ./packages.nix pkgs;

  #Latest emacs from master branch
  nixpkgs.overlays = [
    (import (builtins.fetchGit {
      name = "emacs-master-pinned-21-07-21";
      url = https://github.com/nix-community/emacs-overlay;
      ref = "refs/heads/master";
      rev = "676a4f41e776229df3f191962b08d7c7c7891e33";
    }))
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
    extraPackages = (epkgs: [ epkgs.vterm ]);
  };

  programs.zsh.enable = true;
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
  programs.password-store.enable = true;
  services.syncthing = {
    enable = true;
    tray = {
      #enable = true;
    };

  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "konsole";
    BROWSER = "brave";
    JAVA_HOME="$HOME/.nix-profile/lib/openjdk";
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
