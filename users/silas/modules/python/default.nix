{ config, lib, pkgs, ... }:

let
    # mach-nix = import (builtins.fetchGit {
    #     url = "https://github.com/DavHau/mach-nix";
    #     ref = "refs/tags/3.4.0";
    # }) {};
    mach-nix = import (pkgs.fetchFromGitHub {
        owner = "DavHau";
        repo = "mach-nix";
        rev = "26f06e415a74dc10727cf9c9a40c83b635238900";
        sha256 = "0n5a3rnv9qnnsrl76kpi6dmaxmwj1mpdd2g0b4n1wfimqfaz6gi1";
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
        # (mach-nix.mkPython {
        #     requirements = ''
        #         requests
        #         pulsectl
        #         papis-python-rofi
        #         ipykernel
        #         pyqt5
        # '';
        # })
        # pkgs.nodePackages.pyright
    ];
}
