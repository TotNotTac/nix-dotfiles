{ stdenvNoCC, fetchFromGitHub, python3, pkgs }:

stdenvNoCC.mkDerivation rec {
  pname = "mpv-autosub";
  version = "35115355bd339681f97d067538356c29e5b14afa";

  dontBuild = true;

  src = fetchFromGitHub {
    owner = "davidde";
    repo = "mpv-autosub";
    rev = version;
    sha256 = "sha256-BKT/Tzwl5ZA4fbdc/cxz0+CYc1zyY/KOXc58x5GYow0=";
  };

  nativeBuildInputs = [ python3 pkgs.python39Packages.subliminal ];

  patchFile = ./mpv-autosub.patch;

  patches = [
    patchFile
  ];

  installPhase = ''
    # patch autosub.lua < ${patchFile}
    mkdir -p $out/share/mpv/scripts
    cp autosub.lua $out/share/mpv/scripts
  '';

  passthru.scriptName = "autosub.lua";

  meta = {
    description = "Automatic subtitle downloader for MPV";
    homepage = "https://github.com/davidde/mpv-autosub";
    license = "MIT";
    platforms = ["x86_64-linux"];
    maintainers = [ "TotNotTac" ];
  };
}
