{ config, pkgs, ...}:

{
  programs.git = {
    enable=true;
    userName="Silas de Jong";
    userEmail="andorthekid@gmail.com";
    extraConfig.http.sslVerify=false;
  };
}
