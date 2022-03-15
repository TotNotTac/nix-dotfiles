{ config, lib, pkgs, ... }:

let
    my-python-packages = python-packages: with python-packages; [
        requests
        pulsectl
        papis-python-rofi
        ipykernel
        # other python packages you want
    ];
    python-with-my-packages = pkgs.python3.withPackages my-python-packages;in
{
    home.packages = [
        python-with-my-packages
        pkgs.nodePackages.pyright
    ];
}
