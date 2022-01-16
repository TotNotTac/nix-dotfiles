{pkgs, stdenv, ...}:

pkgs.writeShellScriptBin "whatIsMyIp" ''
  ${pkgs.curl}/bin/curl http://httpbin.org/get -s | ${pkgs.jq}/bin/jq --raw-output .origin
''
