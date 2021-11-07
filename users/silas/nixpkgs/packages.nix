let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
pkgs: with pkgs; [
    #nix
    nox
    (import ( pkgs.fetchFromGitHub {
      owner = "Shopify";
      repo = "comma";
      rev = "4a62ec17e20ce0e738a8e5126b4298a73903b468";
      sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
    }) {})

    #programming
    openjdk11_headless
    jetbrains.idea-ultimate
    jetbrains.webstorm
    # gitAndTools.gitui
    # lazygit
    ghc
    cabal-install
    stack
    pkg-config
    # haskellPackages.OpenGL
    # haskellPackages.OpenGLRaw
    mariadb
    nodejs
    nodePackages.npm
    nodePackages."@angular/cli"
    # mysql-workbench
    postman
    makeWrapper
    rustup

    #utility
    ranger
    diskonaut
    pstree
    sqlite
    exa
    bat
    etcher
    ark
    ripgrep
    # youtube-dl
    kdeconnect
    speedcrunch
    unzip
    gcc
    sqlite
    gnupg
    appimage-run
    libpulseaudio
    sidequest
    direnv
    ispell
    unstable.plover.dev
    zip

    #finance
    beancount
    wmctrl
    xdotool
    fava

    #office
    libreoffice

    #scripting
    notify-desktop
    babashka

    #internet
    brave
    unstable.vieb
    qbittorrent

    #communication
    #unstable.discord-canary
    #unstable.discord
    discord-canary
    discord
    signal-desktop
    teams

    #multimedia
    spotify
    mpv
    feh
    aegisub
    webcamoid
    peek
    gimp
    avidemux
    unstable.yt-dlp

    #games
    minecraft
    unstable.multimc
  ]
