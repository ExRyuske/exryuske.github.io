{ config, lib, pkgs, ... }:

{
  imports = [ ];

  home.stateVersion = "24.05";
  programs = {

    # Zsh
    zsh = {
      enable = true;
      shellAliases = {
        maid-nix-update = "curl http://192.3.1.1:3000/ExRyuske/dotfiles/raw/branch/main/install.sh | sh -s vm update";
        maid-git-push = "git add . && git commit -m \"update\" && git push";
      };
    };

    # Git
    git = {
      enable = true;
      userName = "ExRyuske";
      userEmail = "exryuske@proton.me";
    };
  };
}
