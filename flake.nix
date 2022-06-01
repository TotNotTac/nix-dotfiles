
{
    description = "TotNotTac's nixos configuration flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-22.05";

        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ { self, nixpkgs, home-manager }:
        let
            system = "x86_64-linux";
        in
          {
              nixosConfigurations = (import ./outputs/nixos-conf.nix {
                  inherit (nixpkgs) lib;
                  inherit inputs system;
              });

              homeConfigurations = (
                  import ./users/silas/home-conf.nix {
                      inherit system nixpkgs home-manager;
                  }
              );
          };
}
