{ system, nixpkgs, home-manager, rust-overlay, ... }:

let
  username = "silas";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

  overlays = [ (import rust-overlay) ];
  pkgs = import nixpkgs {
    inherit system overlays;
    config.allowUnfree = true;
    config.xdg.configHome = configHome;

  };

  unstable = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      config.xdg.configHome = configHome;
      overlays = [];
  };
in
{
    silas = home-manager.lib.homeManagerConfiguration rec {
        inherit pkgs;

        modules = [
            ./../users/silas/home.nix
        ];
    };
}
