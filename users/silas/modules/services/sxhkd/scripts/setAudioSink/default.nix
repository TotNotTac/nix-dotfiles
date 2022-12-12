{ pkgs, ... }:

let
  app = pkgs.python3Packages.buildPythonApplication {
    pname = "python-switch-sink";
    version = "1.0";

    propagatedBuildInputs = with pkgs.python3Packages; [
      papis-python-rofi
      pulsectl
    ];

    src = ./.;
  };
in
pkgs.writeShellScriptBin "switchSink" ''
  ${app}/bin/main.py; pulseaudio -k
''
