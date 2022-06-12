{ lib, inputs, system, ... }:

{
    default = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
            ./../systems/lenovo/configuration.nix
        ];
    };

    workvm = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs;  };

        modules = [
            ./../systems/workvm/configuration.nix
        ];
    };
}
