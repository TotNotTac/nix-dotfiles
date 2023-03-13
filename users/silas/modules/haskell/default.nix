{ pkgs, ... }:

{
  home.file = {
    ".ghci".text = ''
        :set prompt "\ESC[38;2;169;117;159m\x03BB=\ESC[0m\r\t\b\b\b\b\b"
    '';
  };
  home.packages = with pkgs; [
    ghcid
    # ( ghc.withPackages (pkgs: with pkgs; [ xmonad xmonad-contrib ]) )
    ghc
    haskell-language-server
    cabal-install
  ];
}
