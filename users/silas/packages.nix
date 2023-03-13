{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #Dictionaries
    languagetool

    #nix
    comma
    rnix-lsp
    nix-output-monitor
    nix-index
    distrobox

    #programming
    gdb
    delve
    unstable.gopls
    (callPackage ./modules/programs/terminal/whatIsMyIp { })
    alacritty
    idris2
    # cargo
    pkg-config
    stm32cubemx
    (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
      extensions = [
        "rust-src"
        "rustfmt"
        "llvm-tools-preview"
      ];
      targets = [ "wasm32-unknown-unknown" "thumbv7em-none-eabihf" "thumbv7em-none-eabi" ];
    }))
    arduino
    probe-run
    libudev-zero
    libusb1
    rust-analyzer
    cmake
    trunk
    babashka
    clojure
    clojure-lsp
    entr
    glib
    # jdk
    jetbrains.datagrip
    jetbrains.goland
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
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vercel
    postman
    sqlite
    stack
    tree-sitter
    ueberzug
    # vscode
    unstable.vscode
    python3
    poetry
    hy
    zlib
    # nodejs-16_x.nodePackages.prettier
    mongodb
    robo3t
    # podman-tui
    # podman-compose
    lazydocker
    docker-compose
    (pkgs.callPackage (pkgs.path + "/pkgs/development/libraries/protobuf/generic-v3.nix") {
      version = "3.12.4";
      sha256 = "sha256-VyzFq1agobjvei4o/fQ8iMOLySf38DQsLb3C8kCz+78=";
    })
    gitlab-runner

    #utility
    reptyr
    ark
    bat
    glow
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
    (callPackage ./modules/programs/launchers/rofi { })
    tldr
    gitflow
    cz-cli
    pre-commit
    moreutils
    sonar-scanner-cli

    #office
    libreoffice
    pandoc #for markdown rendering
    zotero #bibliography and refferences
    texlive.combined.scheme-full
    texlab
    gnuplot
    obsidian
    google-drive-ocamlfuse
    slack

    #scripting
    notify-desktop
    wmctrl
    xdotool
    autokey
    xorg.xwininfo
    mprocs

    #internet
    brave
    qbittorrent
    rclone

    #communication
    discord
    thunderbird

    #drawing
    krita

    #multimedia
    kdenlive
    feh
    peek
    spotify
    yt-dlp
    qpwgraph
    zathura
    easyeffects
    vlc
    #python39Packages.subliminal
    mixxx
    obs-studio

    #gaming
    wine
    lutris
    unstable.prismlauncher
    sidequest
    nudoku
  ];
}
