{ pkgs, ... }:

{
  systemd.user.services."rclone-gdrive" = {
    Unit.Description = "Rclone google drive mount";
    Install.WantedBy = [ "network-online.target" ];
    Service = {
      Type = "notify";
      ExecStart = "${pkgs.rclone}/bin/rclone mount google_drive:keepass %h/google_drive/keepass --vfs-cache-mode full";
      Restart = "always";
      RestartSec = "30";
    };
  };
}
