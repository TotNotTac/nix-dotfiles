{ pkgs, config, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs28NativeComp;
    # extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    cmake #Needed to compile vterm
    gcc
  ];
}
