{
  description = "TotNotTac's nixos configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    devenv.url = "github:cachix/devenv";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs-unstable, nixpkgs, ... } @ inputs:
    let
      system = "x86_64-linux";
      overlay-unstable = _: _: { unstable = import nixpkgs-unstable { config.allowUnfree = true; inherit system; }; };
    in
    {
      nixosConfigurations = {
        default = inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = { inherit inputs; };

          modules = [
            ./systems/lenovo/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.silas = import ./users/silas/home.nix;
            }
            ({ ... }: {
              nixpkgs.overlays = [
                inputs.rust-overlay.overlays.default
                overlay-unstable
              ];
            })
          ];
        };
      };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
