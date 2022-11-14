{ config, pkgs, lib, ... }:

{
    home.packages = [ pkgs.ranger ];

    home.sessionVariables.RANGER_LOAD_DEFAULT_RC = "FALSE";
}
