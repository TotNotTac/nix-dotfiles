
{ config, pkgs, ... }:
{
    virtualisation.libvirtd = {
        enable = true;
        onBoot = "ignore";
        # Disable restoring previous sessions, it takes a while to save the state of running VMs so it can slow down shutdown times
        # Better to only restore VMs when we explicitly start the service with virt-manager.
    };
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager ];

    users.users.silas.extraGroups = [ "libvirtd" ];
}
