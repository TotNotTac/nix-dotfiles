{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      save-position-on-quit = true;
      loop-file = "inf";
      sub-auto = "all";
      osc = "no";
    };
    scripts = with pkgs.mpvScripts; [
      (youtube-quality.override {
        oscSupport = true;
      })
      thumbnail
      sponsorblock
      # (pkgs.callPackage ./mpv-autosub.nix {})
    ];
  };

  home.packages = [
    # Downloading subtitles
    pkgs.python39Packages.subliminal
  ];
}
