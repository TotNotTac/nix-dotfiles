# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #include modules
      ./modules/services/sxhkd
      ./modules/services/mongodb
      ./modules/programs/steam
      ./modules/programs/virt-manager
      ./modules/hardware/logitech
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
  # virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "@wheel" ];

  time.timeZone = "Europe/Amsterdam";

  networking = {
      hostName = "Silas"; # Define your hostname.
      networkmanager.enable = true;
      firewall = {
          # allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
          # allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
      };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  nixpkgs.config.pulseaudio = true;

  services.flatpak.enable = true;
  services.lorri.enable = true;
  # security.pam.services.gdm.enableGnomeKeyring = true;
  # services.gnome.gnome-keyring.enable = true;

  services.xserver = {
      enable = true;

      displayManager.sddm.enable = true;

      desktopManager = {
          plasma5.enable = true;
      };

  };

  services.mysql = {
      enable = true;
      package = pkgs.mariadb;
  };

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
      unrar
      (wine.override { wineBuild = "wine64";})
      steam
  ];

  users = {
      mutableUsers = true;
      users.silas = {
          isNormalUser = true;
          password = "nix";
          extraGroups = ["sudo" "wheel" "networkmanager" "audio" "video" "tty" "docker" "dialout" "jackaudio"];

          shell = pkgs.zsh;
      };
  };
  nix.trustedUsers = ["@wheel" "silas"];

  programs.zsh.enable = true;

  nix.gc = {
      automatic=true;
      options = "--delete-older-than 5d";
  };
  nix.autoOptimiseStore = true;

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
