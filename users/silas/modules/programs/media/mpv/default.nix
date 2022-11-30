{ config, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      save-position-on-quit = true;
      loop-file = "inf";
    };
  };
}
  
