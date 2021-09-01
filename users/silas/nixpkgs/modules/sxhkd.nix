{ config, pkgs, ... }:

{
  services.sxhkd = {
    enable = true;
    extraConfig = ''
      super + q
            xdotool getactivewindow windowclose

      super + Return
            $TERMINAL

      meta + Return
            notify-desktop
    '';
  };
}
