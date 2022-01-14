# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
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

 virtualisation.docker.enable = true;
 virtualisation.virtualbox.host.enable = true;
 users.extraGroups.vboxusers.members = [ "@wheel" ];

 time.timeZone = "Europe/Amsterdam";

  networking = {
    hostName = "Silas"; # Define your hostname.
    #interfaces.enp0s3.useDHCP = true;
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

  # services.syncthing = {
  #   enable = true;
  #   user = "silas";
  #   dataDir = "/home/silas/Sync";
  # }; 
  services.flatpak.enable = true;
  services.lorri.enable = true;
  #services.pipewire = {
  #  enable=true;
  #  alsa.enable=true;
  #  pulse.enable=true;
  #  jack.enable=true;
  #};
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    #libinput.enable = false;
    #synaptics.enable = true;
    windowManager.xmonad = {
      enable = true;
      extraPackages = haskellPackages: [
      ];
      enableContribAndExtras = true;
    };
    desktopManager = {
      plasma5.enable = true;
    };
  };


 #services.emacs.package = pkgs.emacsUnstable;

 # nixpkgs.overlays = [
 #   (import (builtins.fetchTarball {
 #     url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
 #   }))
 # ];

  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    #home-manager
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
    #emacs
    cmake
    # wineWowPackages.stable
  ];
  nixpkgs.config.permittedInsecurePackages = [
  ];

  environment.variables = {
    #"SSL_CERT_FILE" = "/etc/ssl/certs/ca-bundle.crt";
    #"CURL_CA_BUNDLE" = "/etc/ssl/certs/ca-certificates.crt";
  };

  users.users.silas = {
    isNormalUser = true;
    home = "/home/silas";
    description = "Silas";
    extraGroups = ["sudo" "wheel" "networkmanager" "audio" "video" "tty" "docker"];
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
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

