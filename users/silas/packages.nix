{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        #Dictionaries
        aspell
        aspellDicts.nl
        aspellDicts.en

        #nix
        comma
        rnix-lsp

        #programming
        unstable.haskell-language-server
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
        babashka
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
        yarn
        nodejs
        postman
        sqlite
        stack
        tree-sitter
        ueberzug
        vscode
        zlib
        nodePackages.prettier
        mongodb
        robo3t
        lazydocker
        (pkgs.callPackage (pkgs.path + "/pkgs/development/libraries/protobuf/generic-v3.nix") {
            version = "3.12.4";
            sha256 = "sha256-VyzFq1agobjvei4o/fQ8iMOLySf38DQsLb3C8kCz+78=";
        })

        #utility
        ark
        bat
        openvpn
        direnv
        fzf
        atool
        unstable.clifm
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
        hello
        (callPackage ./modules/programs/launchers/rofi {})
        tldr

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
        qpwgraph
        helvum
        vlc

        #gaming
        polymc
        wine
    ];
}
