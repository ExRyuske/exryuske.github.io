{ config, lib, pkgs, ... }:

{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    # OpenCL
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  # LACT
  environment.systemPackages = with pkgs; [ lact ];
  systemd = {
    packages = with pkgs; [ lact ];
    services.lactd.wantedBy = ["multi-user.target"];
  };
}
