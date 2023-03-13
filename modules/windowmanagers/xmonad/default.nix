{ ... }:

{
  services.xserver.windowManager = {
    xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.dbus
        haskellPackages.List
        haskellPackages.monad-logger
      ];
      ghcArgs = [
        "-package xmonad"
        "-package xmonad-contrib"
      ];
    };
  };
}
