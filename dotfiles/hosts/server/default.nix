{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../hardware-configuration.nix

      ../../modules/general.nix
      ../../modules/grub.nix
    ];

  # Network
  networking = {
    hostName = "server";
  };

  # User
  users.users = {
    server = {
      hashedPassword = "$y$j9T$Xx4vVFizMf1dSdwzntHQw0$8Sxru7oy1hUvi6nHVlcR9CLq470BE0B8xND62zt/ibA";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
        ];
      };
    exryuske = {
      hashedPassword = "$y$j9T$t1hNl4f8PPpbCKTh2EV881$6f64lp0OxXMlt2zGtP41vhV4cN1eNHo02k1FIDUMpQ5";
      isNormalUser = true;
    };
  };

  # Docker + Compose
  virtualisation.docker.enable = true;
  environment.systemPackages = with pkgs; [
    #compose2nix
  ];

  # Samba
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    shares = {
      root = {
        path = "/";
        browseable = "no";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0775";
        "directory mask" = "0775";
        "force user" = "root";
      };
      exryuske = {
        path = "/home/exryuske";
        browseable = "no";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0755";
        "directory mask" = "0755";
        "force user" = "exryuske";
      };
    };
  };
}
