{ pkgs, ... }:
{
    home.packages = with pkgs; [(callPackage ./plover.nix {})];
}
