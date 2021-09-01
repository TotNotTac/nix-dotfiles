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
    openjdk11
    jetbrains.idea-ultimate
    gitAndTools.gitui
    lazygit
    ghc
    cabal-install
    stack
    haskellPackages.OpenGL
    haskellPackages.OpenGLRaw

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
    youtube-dl
    kdeconnect
    plover.dev
    speedcrunch

    #finance
    beancount
    wmctrl
    xdotool
    fava

    #scripting
    notify-desktop
    babashka

    #internet
    brave
    vieb
    qbittorrent

    #communication
    unstable.discord-canary
    unstable.discord
    signal-desktop
    teams

    #multimedia
    spotify
    mpv
    feh
    aegisub
  ]
