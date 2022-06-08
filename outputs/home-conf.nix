{ system, nixpkgs, home-manager, ... }:

let
  username = "silas";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
    config.xdg.configHome = configHome;
    overlays = [];
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
    inherit pkgs system username homeDirectory;

    stateVersion = "21.03";
    configuration = import ./../users/silas/home.nix {
      inherit pkgs unstable;
      inherit (pkgs) config lib stdenv;
    };
  };
}
