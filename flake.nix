{
    description = "TotNotTac's nixos configuration flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-22.05";
        nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
        rust-overlay.url = "github:oxalica/rust-overlay";

        home-manager = {
            url = "github:nix-community/home-manager/release-22.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, home-manager,  ... } @ inputs:
        let
            system = "x86_64-linux";
        in {
            nixosConfigurations = {
                default = inputs.nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = { inherit inputs; };

                    modules = [
                        ./systems/lenovo/configuration.nix
                        home-manager.nixosModules.home-manager {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.silas = import ./users/silas/home.nix;
                        }
                        ({ pkgs, ... }: {
                            nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
                            # environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
                        })
                    ];
                };
            };
        };
}
