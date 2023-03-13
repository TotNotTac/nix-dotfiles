{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = (pkgs.emacs.override { nativeComp = true; withXwidgets = true; withGTK3 = true; });
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    cmake #Needed to compile vterm
    gcc
    fd
    imagemagick
    mediainfo
  ];
}
