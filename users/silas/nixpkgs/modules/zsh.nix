{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    shellAliases = {
      vim = "nvim";
      ls="exa";
      ll="exa -lah";
      cat="bat";
      nixsys="cd ~/.dotfiles/system/nixos";
      nixhome="cd ~/.dotfiles/users/silas/nixpkgs";
      packages="vim ~/.dotfiles/users/silas/nixpkgs/packages.nix";
      homeswitch="home-manager switch";
      addpkg="vim ~/.dotfiles/users/silas/nixpkgs/packages.nix && home-manager switch";
    };

    envExtra = ''
      EDITOR=nvim
      VISUAL=nvim
    '';

    initExtra = ''
      eval "$(direnv hook zsh)"
    '';

    plugins = [
      { 
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner ="zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];
  };
  programs.zsh.oh-my-zsh = {
    enable=true;
    theme="robbyrussell";
    plugins = [
      "git"
      "sudo"
    ];
  };
}
