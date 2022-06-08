pkgs: unstable: with pkgs; [
    #Dictionaries
    aspell
    aspellDicts.nl

    #nix
    rnix-lsp
    comma

    #programming
    kitty
    alacritty
    ueberzug
    tree-sitter
    entr
    jdk
    clojure
    clojure-lsp
    clj-kondo
    maven
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.pycharm-professional
    jetbrains.datagrip
    ghc
    cabal-install
    # unstable.haskell-language-server
    stack
    postman
    (callPackage ./modules/programs/terminal/whatIsMyIp {})
    nodejs
    nodePackages.npm
    zlib
    glib
    vscode
    sqlite
    pipenv
    jq
    cargo
    rustc
    robo3t
    mongodb-tools
    docker-compose

    #utility
    ranger
    diskonaut
    sqlite
    exa
    bat
    ark
    ripgrep
    kdeconnect
    speedcrunch
    unzip
    sqlite
    gnupg
    direnv
    ispell
    flameshot
    xclip
    zip

    #office
    libreoffice

    #scripting
    notify-desktop
    wmctrl
    xdotool

    #internet
    brave
    qbittorrent

    #communication
    discord
    signal-desktop

    #multimedia
    spotify
    feh
    peek
    yt-dlp
]
