{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    tmuxinator.enable = true;
    keyMode = "vi";

    prefix = "C-Space";

    plugins = [
      { plugin = pkgs.tmuxPlugins.onedark-theme; }
    ];
  };
}
