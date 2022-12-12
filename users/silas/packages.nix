{ pkgs, ... }:

{
    home.packages = with pkgs; [
        #Dictionaries
        aspell
        aspellDicts.nl
        aspellDicts.en

        #nix
        comma
        rnix-lsp
        nix-output-monitor
        nix-index
        distrobox

        #programming
        unstable.haskell-language-server
        ghcid
        (callPackage ./modules/programs/terminal/whatIsMyIp {})
        alacritty
        cabal-install
        idris2
        # cargo
        stm32cubemx
        (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
            extensions = [
                "rust-src"
                "rustfmt"
                "llvm-tools-preview"
            ];
            targets = [ "wasm32-unknown-unknown" "thumbv7em-none-eabihf" "thumbv7em-none-eabi" ];
        }))
        platformio
        arduino
        gcc-arm-embedded
        probe-run
        libudev-zero
        libusb1
        rust-analyzer
        cmake
        trunk
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
        # nodejs-16_x.nodePackages.npm
        yarn
        nodejs-16_x
        postman
        sqlite
        stack
        tree-sitter
        ueberzug
        # vscode
        unstable.vscode
        python3
        zlib
        # nodejs-16_x.nodePackages.prettier
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
        diskonaut
        exa
        flameshot
        gnupg
        ispell
        ripgrep
        speedcrunch
        sqlite
        unzip
        xclip
        zip
        qmk
        unstable.warpd
        (callPackage ./modules/programs/launchers/rofi {})
        tldr
        gitflow

        #office
        libreoffice
        pandoc #for markdown rendering
        zotero #bibliography and refferences

        #scripting
        notify-desktop
        wmctrl
        xdotool
        autokey

        #internet
        brave
        qbittorrent

        #communication
        discord
        thunderbird

        #drawing
        krita

        #multimedia
        feh
        peek
        spotify
        yt-dlp
        qpwgraph
        easyeffects
        vlc
        mixxx

        #gaming
        wine
        lutris
        prismlauncher
    ];
}
