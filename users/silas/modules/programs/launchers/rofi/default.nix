{ pkgs, ... }:
let
  custom-rofi = pkgs.fetchFromGitHub {
    owner = "adi1090x";
    repo = "rofi";
    rev = "9685aefdb68fdd00b34a89b9a01ec0e9793b82e8";
    sha256 = "sha256-rdbB69Py9APDacrXEWa5d0z6qS9D1lSXvo7g5MDUGMk=";
  };
in
pkgs.writeShellScriptBin "rofi-launcher" ''

${custom-rofi}/files/launchers/type-2/launcher.sh

''
