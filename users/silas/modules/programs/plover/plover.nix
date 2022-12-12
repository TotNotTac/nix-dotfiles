{ pkgs }:
let
  path = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "path";
    version = "16.2.0";
    src = fetchPypi {
      inherit pname version;
      hash = "sha256-Lekl6NQh+TvOqA1RG4Gsz7an5rJJr6SlVZVXsM+BcJc=";
    };
    checkInputs = [ pytest ];
  };

  requests-futures = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "requests-futures";
    version = "1.0.0";
    disabled = pythonOlder "3.3";

    src = fetchPypi {
      inherit pname version;
      sha256 = "0j611g1wkn98qp2b16kqz7lfz29a153jyfm02r3h8n0rpw17am1m";
    };

    propagatedBuildInputs = [ requests ];

    doCheck = false;

    pythonImportsCheck = [ "requests_futures" ];
  };

  plover-stroke = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "plover_stroke";
    version = "1.0.0";
    disabled = pythonOlder "3.3";

    src = pkgs.fetchFromGitHub {
      owner = "benoit-pierre";
      repo = "plover_stroke";
      rev = "f5b5c66b9caba07b7a3fe5d4d6c924ed5ee545d7";
      sha256 = "1w80x33l55c9j8i4n2afpxbbd0rm5j906sfmi3fkdxask7sz28c7";
    };
    doCheck = false;
  };

  rtf-tokenize = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "rtf-tokenize";
    version = "1.0.0";
    disabled = pythonOlder "3.3";

    src = pkgs.fetchFromGitHub {
      owner = "benoit-pierre";
      repo = "rtf_tokenize";
      rev = "509b009b97077d5abcebe53d46ca6b67c3438a2c";
      sha256 = "1l5pfrggil9knk58r2r84i9msm7mdhddl87hkfk54qqk2sqzc06g";
    };

    doCheck = false;
  };

  plover = with pkgs.python3Packages; pkgs.qt5.mkDerivationWith buildPythonPackage rec {
    pname = "plover";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "openstenoproject";
      repo = "plover";
      rev = "4394ef158579c1b3088335e3eb7323453fcc0b73";
      sha256 = "1d0xk8k7sdbkd8n1idyjkqqdpgac9hwbw37axlvl7w12hnb4wci7";
    };

    checkInputs = [ pytest mock ];
    propagatedBuildInputs = [
      Babel
      pyqt5
      xlib
      pyserial
      appdirs
      wcwidth
      setuptools
      certifi
      plover-stroke
      rtf-tokenize
    ];

    dontWrapQtApps = true;

    preFixup = ''
      makeWrapperArgs+=("''${qtWrapperArgs[@]}")
    '';

    doCheck = false;
  };

  plugins-manager = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "plover-plugins-manager";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "benoit-pierre";
      repo = "plover_plugins_manager";
      rev = "24e75eea281300287d72c0d9022d37ee2e302ed8";
      sha256 = "1s4ccp8i28k787hap3k0pxv21b87zqah40ygpvps86s26pyj3wcp";
    };

    patches = [ ./plover-plugins-manager.patch ];

    buildInputs = [ plover ];

    propagatedBuildInputs = [
      pip
      pkginfo
      pygments
      readme_renderer
      requests
      requests-cache
      requests-futures
      setuptools
      wheel
    ];
    checkInputs = [ path pytest ];

    doCheck = false;
  };
in
plover.overrideAttrs (old: rec {
  pname = "plover-with-plugins";
  propagatedBuildInputs = old.propagatedBuildInputs ++ [ pkgs.python3Packages.setuptools plugins-manager ];

  permitUserSite = true;
})
