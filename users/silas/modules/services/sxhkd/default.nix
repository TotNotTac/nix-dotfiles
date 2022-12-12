{ pkgs, ... }:
{
  # home.file.".config/sxhkd/sxhkdrc".source = config.lib.file.mkOutOfStoreSymlink ./sxhkdrc;

  services.sxhkd = {
    enable = true;
    extraConfig = builtins.readFile ./sxhkdrc;
  };

  home.packages = [
    (pkgs.callPackage ./scripts/setAudioSink { })
  ];

}
