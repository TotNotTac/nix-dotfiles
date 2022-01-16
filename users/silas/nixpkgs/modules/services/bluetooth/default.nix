{ config, lib, pkgs, ... }:

{
  #Enable media control buttons
  services.mpris-proxy.enable = true;

  #Automatically switch to headset on connect
  hardware.pulseaudio.extraConfig = "
  load-module module-switch-on-connect
  ";

}
