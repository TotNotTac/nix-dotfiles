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
      e="emacsclient -a '' -c";
      magit="setsid emacsclient -a '' -c -e '(magit-status)' >/dev/null 2>&1";
      ve="$VISUAL";
      nixsys="cd ~/.dotfiles/system/nixos";
      nixhome="cd ~/.dotfiles/users/silas/nixpkgs";
      packages="vim ~/.dotfiles/users/silas/nixpkgs/packages.nix";
      homeswitch="home-manager switch";
      addpkg="vim ~/.dotfiles/users/silas/nixpkgs/packages.nix && home-manager switch";
      slep="xinput set-prop 13 'Device Enabled' 0 && systemctl suspend";
      woke="xinput set-prop 13 'Device Enabled' 1 && exit";
      ij="setsid idea-ultimate . >/dev/null 2>&1";
      ws="setsid webstorm . >/dev/null 2>&1";
      runPlover=", xhost + && sudo plover";
    };

    envExtra = ''
      EDITOR='emacsclient -a "" -c'
      VISUAL='emacsclient -a "" -c'
      SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
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
      "vi-mode"
    ];
  };
}
