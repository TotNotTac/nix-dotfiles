# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page

{ pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #include modules
      ./../../modules/services/sxhkd
      ./../../modules/services/databases
      ./../../modules/programs/steam
      # ./../../modules/programs/nix-alien
      ./../../modules/programs/virt-manager
      ./../../modules/hardware/logitech
      ./../../modules/audio
      ../../modules/windowmanagers/xmonad
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets."/crypto_keyfile.bin" = null;

  boot.supportedFilesystems = [ "ntfs" ];

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  hardware.bluetooth = {
    enable = true;
    # package = pkgs.bluezFull;
    # settings.General.ControllerMode = "bredr";
  };
  hardware.opengl.enable = true;

  virtualisation.docker.enable = true;
  # virtualisation.podman = {
  #     enable = true;
  #     defaultNetwork.dnsname.enable = true;
  # };
  users.extraGroups.vboxusers.members = [ "@wheel" ];

  i18n.defaultLocale = "nl_NL.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "nl_NL.UTF-8";
  };
  time.timeZone = "Europe/Amsterdam";

  networking = {
    hostName = "Silas"; # Define your hostname.
    networkmanager.enable = true;
  };

  services.flatpak.enable = true;
  services.lorri.enable = true;

  programs.kdeconnect.enable = true;

  services.xserver = {
    enable = true;

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
    libinput.enable = true;
  };

  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
  };

  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  programs.nix-ld.enable = true;
  programs.java.enable = true;

  # # Can't enable this yet, in the upcoming NixOS release this will make things so much easier. https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/
  # programs.nix-ld.libraries = with pkgs; [
  #   stdenv.cc.cc
  #   zlib
  #   fuse3
  #   icu
  #   zlib
  #   nss
  #   openssl
  #   curl
  #   expat
  #   # ...
  # ];

  environment.systemPackages = with pkgs; [
    home-manager
    git
    wget
    vim
    firefox
    htop
    killall
    gparted
    unrar
    (wine.override { wineBuild = "wine64"; })
    inputs.devenv.packages.x86_64-linux.devenv
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science nl ]))
  ];

  users = {
    mutableUsers = true;
    users.silas = {
      isNormalUser = true;
      password = "nix";
      extraGroups = [ "sudo" "wheel" "networkmanager" "audio" "video" "tty" "docker" "dialout" "jackaudio" "plugdev" ];

      shell = pkgs.zsh;
    };
  };
  nix.settings.trusted-users = [ "@wheel" "silas" ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  # Enable insults on sudo
  security = {
    sudo.package = pkgs.sudo.override {
      withInsults = true;
    };
    apparmor.enable = true;
  };

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 3d";
    dates = "23:00";
  };
  nix.settings.auto-optimise-store = true;

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
  system.stateVersion = "22.05"; # Did you read the comment?

}
