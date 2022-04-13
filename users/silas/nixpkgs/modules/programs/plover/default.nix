{ config, lib, pkgs, ... }:
{
    home.packages = with pkgs; [
        # (python.override (oa: {
        #     packageOverrides = my-python-overrides;
        # }))
        # plover.dev
        (callPackage ./plover.nix {})
    ];
}
