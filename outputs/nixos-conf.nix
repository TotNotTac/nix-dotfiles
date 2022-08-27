{ lib, inputs, system, home-manager, ... }:

{
    default = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
            ./../systems/lenovo/configuration.nix
            (home-manager.nixosModules.home-manager {
                inherit lib;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.silas = import ./../users/silas/home.nix;
            })
        ];
    };

    # workvm = lib.nixosSystem {
    #     inherit system;
    #     specialArgs = { inherit inputs;  };

    #     modules = [
    #         ./../systems/workvm/configuration.nix
    #     ];
    # };
}
