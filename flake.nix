{
    description = "TotNotTac's nixos configuration flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-22.05";
        nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
        rust-overlay.url = "github:oxalica/rust-overlay";
        nix-alien.url = "github:thiagokokada/nix-alien";
        home-manager = {
            url = "github:nix-community/home-manager/release-22.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { home-manager, nixpkgs-unstable, nix-alien, ... } @ inputs:
        let
            system = "x86_64-linux";
            overlay-unstable = _: _: { unstable = import nixpkgs-unstable { config.allowUnfree = true; inherit system; }; };
            nix-alien-pkgs = inputs.nix-alien.packages.${system};
        in {
            nixosConfigurations = {
                default = inputs.nixpkgs.lib.nixosSystem {
                    inherit system;

                    specialArgs = { inherit inputs nix-alien-pkgs; };

                    modules = [
                        ./systems/lenovo/configuration.nix
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.silas = import ./users/silas/home.nix;
                        }
                        ({ ... }: {
                            nixpkgs.overlays = [
                                inputs.rust-overlay.overlays.default overlay-unstable
                            ];
                        })
                    ];
                };
            };
        };
}
