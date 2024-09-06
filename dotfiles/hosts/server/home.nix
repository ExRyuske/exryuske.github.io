{ config, lib, pkgs, ... }:

{
  imports = [ ];

  home.stateVersion = "24.05";

  # Zsh
  programs.zsh = {
    enable = true;
    shellAliases = {
      maid-nix-update = "curl http://192.3.1.1:3000/ExRyuske/dotfiles/raw/branch/main/install.sh | sh -s server update";
      maid-git-push = "git add . && git commit -m \"update\" && git push";
    };
  };
}
