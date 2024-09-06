{ config, lib, pkgs, ... }:

{
  services.easyeffects = {
    enable = true;
  };
  xdg.configFile = {
    "easyeffects/input/ExRyuske.json".source = ./input/ExRyuske.json;
    "easyeffects/output/ExRyuske.json".source = ./output/ExRyuske.json;
  };
}

