{ config, lib, ... }:

{
  home.file.".config/bspwmrc".source = config.lib.file.mkOutOfStoreSymlink ./bspwmrc;

  #home.file.".config/sxhkd/sxhkdrc".source = config.lib.file.mkOutOfStoreSymlink ./sxhkdrc;
}
