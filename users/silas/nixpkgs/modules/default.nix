{ config, pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./git.nix
    ./zsh.nix
    ./sxhkd.nix
    ./xmonad/xmonad.nix
    ./mpv.nix
    ./xresources.nix
  ];
}
