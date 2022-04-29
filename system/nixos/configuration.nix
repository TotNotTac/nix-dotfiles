# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/services/sxhkd
      ./modules/services/mongodb
      ./modules/programs/steam
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      fsIdentifier = "label";
      efiSupport = true;
      useOSProber = true;
      extraEntries = ''
        menuEntry "Windows" {
          insmod part_gpt
          insmod fat
          insmod search_fs_uuid
          insmod chain
          search --fs-uuid --set=root 306EF95C6EF91B74
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
     '';
    };
  };

  boot.supportedFilesystems = [ "ntfs" ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
   '';
  };

  hardware.bluetooth.enable = true;

  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "@wheel" ];

  time.timeZone = "Europe/Amsterdam";

  networking = {
    hostName = "Silas"; # Define your hostname.
    networkmanager.enable = true;
    firewall = {
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  nixpkgs.config.pulseaudio = true;

  # services.jack = {
  #   jackd.enable = true;
  #   # support ALSA only programs via ALSA JACK PCM plugin
  #   alsa.enable = false;
  #   # support ALSA only programs via loopback device (supports programs like Steam)
  #   loopback = {
  #     enable = true;
  #     # buffering parameters for dmix device to work with ALSA only semi-professional sound programs
  #     #dmixConfig = ''
  #     #  period_size 2048
  #     #'';
  #   };
  # };

  # security.rtkit.enable = true;
  # services.pipewire = {
  #     enable = true;
  #     alsa.enable = true;
  #     alsa.support32Bit = true;
  #     pulse.enable = true;
  #     jack.enable = true;
  # };

  services.flatpak.enable = true;
  services.lorri.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver = {
    enable = true;
    # displayManager.gdm.enable = true;
    displayManager.sddm.enable = true;
    # windowManager.bspwm.enable = true;
    #libinput.enable = false;
    #synaptics.enable = true;
    desktopManager = {
      plasma5.enable = true;
      # xfce.enable = true;
    };
  };


  #services.emacs.package = pkgs.emacsUnstable;

  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
  #   }))
  # ];

  services.mysql = {
      enable = true;
      package = pkgs.mariadb;
  };

  nix.binaryCaches = [ "https://nixcache.reflex-frp.org" ];
  nix.binaryCachePublicKeys = [ "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI=" ];

  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    home-manager
    git
    wget 
    vim
    firefox
    htop
    killall
    partition-manager
    lightspark
    unrar
    openssl
    (wine.override { wineBuild = "wine64";})
    cacert
    steam
    cmake
    #Pipewire
    # qjackctl
    # jack2
  ];
  nixpkgs.config.permittedInsecurePackages = [
  ];

  # environment.variables = {
  #   #"SSL_CERT_FILE" = "/etc/ssl/certs/ca-bundle.crt";
  #   #"CURL_CA_BUNDLE" = "/etc/ssl/certs/ca-certificates.crt";
  # };

  users.users.silas = {
    isNormalUser = true;
    home = "/home/silas";
    description = "Silas";
    extraGroups = ["sudo" "wheel" "networkmanager" "audio" "video" "tty" "docker" "dialout" "jackaudio"];
    shell = pkgs.zsh;
  };
  nix.trustedUsers = ["@wheel" "silas"];

  programs.zsh.enable = true;

  nix.gc = {
    automatic=true;
    options = "--delete-older-than 15d";
  };
  nix.autoOptimiseStore = true;


  # Select internationalisation properties.
  i18n = {
      # defaultLocale = "en_US.UTF-8";
      # inputMethod = {
      #     enabled = "fcitx";
      #     fcitx.engines = with pkgs.fcitx-engines; [ mozc ];
      # };
  };

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

