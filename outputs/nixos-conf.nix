{ lib, inputs, system, ... }:

{
    default = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
            ./../system/configuration.nix
        ];
    };
}
