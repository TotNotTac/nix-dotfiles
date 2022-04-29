{ config, lib, pkgs, ... }:

let
    mach-nix = import (builtins.fetchGit {
        url = "https://github.com/DavHau/mach-nix";
        ref = "refs/tags/3.4.0";
    }) {};
    my-python-packages = python-packages: with python-packages; [
        requests
        pulsectl
        papis-python-rofi
        ipykernel
        # other python packages you want
    ];
    python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in
{
    home.packages = [
        # python-with-my-packages
        (mach-nix.mkPython {
            requirements = ''
                requests
                pulsectl
                papis-python-rofi
                ipykernel
                pyqt5
        '';
        })
        pkgs.nodePackages.pyright
    ];
}
