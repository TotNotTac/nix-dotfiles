{ pkgs, ... }:

{
  programs.password-store.enable = true;

  home.packages = [
    pkgs.keepassxc
  ];
}
