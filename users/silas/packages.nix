{ config, pkgs, unstable, ... }:
{
    home.packages = with pkgs; [
        #Dictionaries
        aspell
        aspellDicts.nl

        #nix
        comma
        rnix-lsp

        #programming
        # unstable.haskell-language-server
        (callPackage ./modules/programs/terminal/whatIsMyIp {})
        alacritty
        cabal-install
        # cargo
        (rust-bin.stable.latest.default.override {
            extensions = [ "rust-src" "rustfmt" ];
            targets = [ "wasm32-unknown-unknown" ];
        })
        rust-analyzer
        cmake
        trunk
        # clj-kondo
        clojure
        clojure-lsp
        docker-compose
        entr
        ghc
        glib
        jdk
        jetbrains.datagrip
        jetbrains.idea-ultimate
        jetbrains.pycharm-professional
        jetbrains.webstorm
        jq
        kitty
        maven
        mongodb-tools
        nodePackages.npm
        nodejs
        postman
        sqlite
        stack
        tree-sitter
        ueberzug
        vscode
        zlib

        #utility
        ark
        bat
        direnv
        diskonaut
        exa
        flameshot
        gnupg
        ispell
        kdeconnect
        ranger
        ripgrep
        speedcrunch
        sqlite
        unzip
        xclip
        zip
        qmk

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
        thunderbird

        #drawing
        krita
        wacomtablet

        #multimedia
        feh
        peek
        spotify
        yt-dlp

        #gaming
        polymc
        wine
    ];
}
