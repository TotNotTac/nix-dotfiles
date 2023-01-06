{ ... }:

{
  programs.git = {
    enable = true;
    userName = "jongs29";
    extraConfig = {
      "gitlab"."gitlab.fdmci.hva.nl/api/v4".user = "jongs29";
      url = {
        "ssh://git@gitlab.com/maxem/".insteadOf = "https://gitlab.com/maxem/";
      };
    };
    userEmail = "silas.de.jong@hva.nl";
    # extraConfig.http.sslVerify=false;
  };
}
