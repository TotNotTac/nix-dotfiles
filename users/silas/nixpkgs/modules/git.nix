{ config, pkgs, ...}:

{
  programs.git = {
    enable=true;
    userName="jongs29";
    extraConfig = {
      "gitlab"."gitlab.fdmci.hva.nl/api/v4".user ="jongs29";
    };
    userEmail="silas.de.jong@hva.nl";
    extraConfig.http.sslVerify=false;
  };
}
