{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../hardware-configuration.nix

      ../../modules/general.nix
      ../../modules/grub.nix
      ../../modules/amd.nix
      ../../modules/pipewire.nix
      ../../modules/kde.nix
    ];

  # Network
  networking = {
    hostName = "workstation";
    networkmanager.enable = true;
  };

  # User
  users.users.exryuske = {
    hashedPassword = "$y$j9T$t1hNl4f8PPpbCKTh2EV881$6f64lp0OxXMlt2zGtP41vhV4cN1eNHo02k1FIDUMpQ5";
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "gamemode"
      ];
    };

  # Packages
  environment.systemPackages = with pkgs; [
    _64gram
    brave
    git
    goverlay
    heroic
    krita
    mangohud
    nomacs
    (wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    })
    qbittorrent
    steamtinkerlaunch
    upscayl
    vesktop
    vlc
    vscode
  ];
  programs = {
    dconf.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
