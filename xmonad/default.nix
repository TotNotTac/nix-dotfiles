{ pkgs ? import ./dep/nixpkgs {} }:
let
  inherit (import ./dep/gitignoresrc { inherit (pkgs) lib; }) gitignoreSource;
in
  pkgs.haskellPackages.developPackage {
    name = "mypkg";
    root = gitignoreSource ./.;
    modifier = drv:
      pkgs.haskell.lib.addBuildTools drv (with pkgs.haskellPackages;
        [ cabal-install
          haskell-language-server
        ]);
  }
