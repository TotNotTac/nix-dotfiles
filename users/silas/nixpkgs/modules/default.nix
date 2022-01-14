{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./git.nix
    ./zsh.nix
    ./xmonad/xmonad.nix
    ./mpv.nix
    ./xresources.nix
    ./vieb
    ./bspwm/bspwm.nix
  ];
}
