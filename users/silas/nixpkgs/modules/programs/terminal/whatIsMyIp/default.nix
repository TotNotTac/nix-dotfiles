{pkgs, stdenv, ...}:

pkgs.writeShellScriptBin "whatismyip" ''
  ${pkgs.curl}/bin/curl http://httpbin.org/get -s | ${pkgs.jq}/bin/jq --raw-output .origin
''
