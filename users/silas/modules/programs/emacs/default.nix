{ pkgs, config, unstable, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs28NativeComp;
    extraPackages = epkgs: [ epkgs.vterm ];
  };

  home.packages = with pkgs; [
    cmake #Needed to compile vterm
    gcc
  ];
}
