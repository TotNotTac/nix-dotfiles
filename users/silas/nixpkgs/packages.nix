let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
pkgs: with pkgs; [
    #Dictionaries
    aspell
    aspellDicts.nl

    #nix
    nox
    rnix-lsp
    (import ( pkgs.fetchFromGitHub {
        owner = "Shopify";
        repo = "comma";
        rev = "4a62ec17e20ce0e738a8e5126b4298a73903b468";
        sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
    }) {})

    #programming
    unstable.openjdk17_headless
    maven
    jetbrains.idea-ultimate
    jetbrains.webstorm
    ghc
    cabal-install
    haskell-language-server
    stack
    pkg-config
    mariadb
    mysql-workbench
    postman
    makeWrapper
    rustup
    haskellPackages.nix-thunk
    (haskellPackages.callCabal2nix "haskell-docs-cli" (fetchFromGitHub {
        owner = "lazamar";
        repo = "haskell-docs-cli";
        rev = "e7f1a60db8696fc96987a3447d402c4d0d54b5e0";
        sha256 = "sha256-/9VjXFgbBz/OXjxu8/N7enNdVs1sQZmUiKhjSTIl6Fg=";
    }) {})
    (callPackage ./modules/programs/terminal/whatIsMyIp {})

    #utility
    ranger
    diskonaut
    pstree
    sqlite
    exa
    ncdu
    bat
    etcher
    ark
    ripgrep
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
    maim
    xclip
    zip

    # Packages for latex
    pkgs.texlive.combined.scheme-full

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
    reptyr

    #internet
    brave
    unstable.vieb
    qbittorrent

    #communication
    discord-canary
    discord
    signal-desktop
    teams

    #multimedia
    spotify
    celluloid
    feh
    aegisub
    webcamoid
    peek
    gimp
    avidemux
    unstable.yt-dlp

    #games
    minecraft
    lutris

    #Mail
    # offlineimap
]
