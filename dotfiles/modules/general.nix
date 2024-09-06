{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./zsh.nix
    ];

  time.timeZone = "Asia/Yekaterinburg";
  nixpkgs.config.allowUnfree = true;
  nix = { 
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
  };
  system = {
    stateVersion = "24.05";
    autoUpgrade = {
      enable = true;
      dates = "weekly";
    };
  };
}
