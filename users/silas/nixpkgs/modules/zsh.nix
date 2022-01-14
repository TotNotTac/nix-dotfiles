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
      ns="nix-shell";
      nsp="nix-shell -p";
    };

    envExtra = ''
      EDITOR='emacsclient -a "" -c'
      VISUAL='emacsclient -a "" -c'
      SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
      # ZSH_TMUX_AUTOSTART=true
      # ZSH_TMUX_AUTOCONNECT=false
    '';

    initExtra = ''
      source ~/.p10k.zsh
      eval "$(direnv hook zsh)"
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ];  }
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };

  };
  programs.zsh.oh-my-zsh = {
    enable=true;
    #theme="robbyrussell";
    plugins = [
      "git"
      "sudo"
      "vi-mode"
      "tmux"
    ];
  };
}
