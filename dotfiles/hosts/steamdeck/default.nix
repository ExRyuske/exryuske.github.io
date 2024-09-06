{ config, lib, pkgs, ... }:

{
  imports =
    [
      (
        builtins.fetchTarball {
          url = "https://github.com/Jovian-Experiments/Jovian-NixOS/archive/development.tar.gz";
          sha256 = "sha256:0qdk6n4jn2z9bhhp2p0n46sr8j9i8ixfp0lgnlni0n1mfdslkq7k";
        } + "/modules"
      )
      ../../hardware-configuration.nix

      ../../modules/general.nix
      ../../modules/grub.nix
      ../../modules/pipewire.nix
    ];

  # Network
  networking = {
    hostName = "steamdeck";
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
    brave
    heroic
  ];

  # Steam Deck
  services.xserver.desktopManager.gnome.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  jovian = {
    devices.steamdeck.enable = true;
    decky-loader.enable = true;
    steam = {
      enable = true;
      autoStart = true;
      user = "exryuske";
      desktopSession = "gnome";
    };
  };
}
