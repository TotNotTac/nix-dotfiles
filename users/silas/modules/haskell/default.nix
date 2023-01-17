{ pkgs, ... }:

{
  home.file = {
    ".ghci".text = ''
        :set prompt "\ESC[38;2;169;117;159m\x03BB=\ESC[0m\r\t\b\b\b\b\b"
    '';
  };
  home.packages = with pkgs; [
    ghcid
    unstable.ghc
    unstable.haskell-language-server
  ];
}
