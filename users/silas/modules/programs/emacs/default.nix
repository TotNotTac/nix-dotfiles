{ pkgs, config, ... }:
{
  programs.emacs = {
    enable = true;
    package = (pkgs.emacs.override { nativeComp = true; });
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    cmake #Needed to compile vterm
    gcc
  ];
}
