{ pkgs }:

  pkgs.mkShell {
    buildInputs = with pkgs; [
      haskellPackages.hoogle
      cabal2nix
    ];
    shellHook = ''
      alias update="cabal2nix . > default.nix"
      alias run="nix-build release.nix && ./result/bin/*"
    '';
  }
