{ config, pkgs, ... }:
{
    config = {
        virtualisation = {
            hypervGuest.enable = true;
        };

        nixpkgs.overlays = [
            # define or import overlays here
            #
            (self: super: { })
            # (import ./my-overlay.nix)
        ];

        # services.qemuGuest.enable = true;

        fileSystems."/" = {
            device = "/dev/disk/by-label/nixos";
            fsType = "ext4";
            autoResize = true;
        };

        services.openssh.enable = true;
        services.openssh.permitRootLogin = "yes";

        environment.systemPackages = with pkgs;
            [ # some relevant packages here
                pkgs.ghc
            ];

        users = {
            mutableUsers = true;
            users.silas = {
                isNormalUser = true;
                initialPassword = "nix";
                extraGroups = ["sudo" "wheel" "networkmanager" "audio" "video" "tty" ];

                shell = pkgs.zsh;
            };
        };
        nix.trustedUsers = ["@wheel" "silas"];

        # This value determines the NixOS release from which the default
        # settings for stateful data, like file locations and database versions
        # on your system were taken. It‘s perfectly fine and recommended to leave
        # this value at the release version of the first install of this system.
        # Before changing this value read the documentation for this option
        # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
        system.stateVersion = "22.05"; # Did you read the comment?
    };
}
