
# Good example config https://github.com/KnairdA/nixos_home/blob/a28a6b05423e5b41ddd3ac037deaf74e1f25803b/gui/xmonad.nix
{ config, pkgs, ... }:

{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
    extraPackages = haskellPackages: [
      haskellPackages.xmonad
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      pkgs.rofi
    ];
  };
}
