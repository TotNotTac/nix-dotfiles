{ ... }:

{
  programs.password-store.enable = true;

  home.packages = [
    keepassxc
  ];
}
