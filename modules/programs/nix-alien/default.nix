
{ nix-alien-pkgs, ... }:
{
    environment.systemPackages = [
        nix-alien-pkgs.nix-alien
    ];
}
