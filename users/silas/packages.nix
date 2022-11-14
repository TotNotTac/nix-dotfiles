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
        nix-output-monitor

        #programming
        unstable.haskell-language-server
        (callPackage ./modules/programs/terminal/whatIsMyIp {})
        alacritty
        cabal-install
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
        # vscode
        unstable.vscode
        python3
        # (unstable.vscode-with-extensions.override {
        #     vscodeExtensions = with pkgs.vscode-extensions; [
        #         matklad.rust-analyzer
        #         ms-azuretools.vscode-docker
        #         dbaeumer.vscode-eslint
        #         esbenp.prettier-vscode
        #         vscodevim.vim
        #         eamodio.gitlens
        #     ] ++ vscode-utils.extensionsFromVscodeMarketplace [
        #         {
        #             name = "code-runner";
        #             publisher = "formulahendry";
        #             version = "0.6.33";
        #             sha256 = "166ia73vrcl5c9hm4q1a73qdn56m0jc7flfsk5p5q41na9f10lb0";
        #         }
        #         {
        #             name = "remote-containers";
        #             publisher = "ms-vscode-remote";
        #             version = "0.260.0";
        #             sha256 = "sha256-MnY0NdfLEP4cDBUwuQPLFZUUxWJDH2838tq0Cslm+L4=";
        #         }
        #     ];
        # })
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
        vlc

        #gaming
        polymc
        wine
        lutris
    ];
}
