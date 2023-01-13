{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    tmuxinator.enable = true;
    keyMode = "vi";
    prefix = "C-Space";

    plugins = [
      { plugin = pkgs.tmuxPlugins.onedark-theme; }
    ];
  };
}
