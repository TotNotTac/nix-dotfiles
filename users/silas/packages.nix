# let
#     unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
# in
pkgs: with pkgs; [
    #Dictionaries
    aspell
    aspellDicts.nl

    #nix
    rnix-lsp
    comma
    # (import ( pkgs.fetchFromGitHub {
    #     owner = "nix-community";
    #     repo = "comma";
    #     rev = "034a9ca440370fc1eccbed43ff345fb6ea1f0d27";
    #     sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
    # }) {})

    #programming
    tree-sitter
    entr
    haskellPackages.tree-sitter-haskell
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
    haskell-language-server
    stack
    postman
    # (haskellPackages.callCabal2nix "haskell-docs-cli" (fetchFromGitHub {
    #     owner = "lazamar";
    #     repo = "haskell-docs-cli";
    #     rev = "e7f1a60db8696fc96987a3447d402c4d0d54b5e0";
    #     sha256 = "sha256-/9VjXFgbBz/OXjxu8/N7enNdVs1sQZmUiKhjSTIl6Fg=";
    # }) {})
    (callPackage ./modules/programs/terminal/whatIsMyIp {})
    nodejs
    nodePackages.npm
    zlib
    glib
    vscode
    sqlite
    pipenv
    # emacs
    jq
    #rustup
    cargo
    rustc
    robo3t
    mongodb-tools

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
    # maim
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

    #games
    minecraft
]
