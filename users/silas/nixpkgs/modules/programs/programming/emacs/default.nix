{ config, lib, pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchGit {
      name = "emacs-master-pinned-21-07-21";
      url = https://github.com/nix-community/emacs-overlay;
      ref = "refs/heads/master";
      rev = "676a4f41e776229df3f191962b08d7c7c7891e33";
    }))
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
    extraPackages = (epkgs: [ epkgs.vterm ]);
  };
}
