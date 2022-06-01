{ pkgs, config, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  programs.emacs = {
    enable = true;
    package = unstable.emacs.override { nativeComp = true; };
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    cmake #Needed to compile vterm
    gcc
  ];
}
