{
    description = "TotNotTac's nixos configuration flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-22.05";
        nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";

        home-manager = {
            url = github:nix-community/home-manager;
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ { self, ... }:
        let
            system = "x86_64-linux";
        in
          with inputs; {
              nixosConfigurations = (
                  import ./outputs/nixos-conf.nix {
                      inherit (nixpkgs) lib;
                      inherit inputs system;
                  });

              homeConfigurations = (
                  import ./outputs/home-conf.nix {
                      inherit system nixpkgs nixpkgs-unstable home-manager;
                  }
              );
          };
}
