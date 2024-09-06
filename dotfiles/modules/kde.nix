{ config, lib, pkgs, ... }:

{
  services = {
    xserver.enable = false;
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasma";
      sddm.wayland.enable = true;
    };
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      gwenview
      okular
      khelpcenter
      print-manager
    ];
  };
}
