#!/bin/sh

install() {
    sudo nixos-generate-config --no-filesystems --root /mnt
    sudo rm /mnt/etc/nixos/configuration.nix
    sudo mv ~/dotfiles/home-manager /mnt/etc/nixos/
    sudo mv ~/dotfiles/hosts /mnt/etc/nixos/
    sudo mv ~/dotfiles/modules /mnt/etc/nixos/
    sudo mv ~/dotfiles/flake.nix /mnt/etc/nixos/
    sudo rm -r ~/dotfiles
}

update() {
    sudo rm -r /etc/nixos/home-manager
    sudo rm -r /etc/nixos/hosts
    sudo rm -r /etc/nixos/modules
    sudo rm /etc/nixos/flake.nix
    sudo mv ~/dotfiles/home-manager /etc/nixos/
    sudo mv ~/dotfiles/hosts /etc/nixos/
    sudo mv ~/dotfiles/modules /etc/nixos/
    sudo mv ~/dotfiles/flake.nix /etc/nixos/
    sudo rm -r ~/dotfiles
}

if [ "$1" = "workstation" ] || [ "$1" = "server" ] || [ "$1" = "steamdeck" ] || [ "$1" = "vm" ]; then
    if [ "$2" = "" ]; then
        nix-shell -p git --command "git clone http://192.3.1.1:3000/ExRyuske/dotfiles.git && exit"
        sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ~/dotfiles/hosts/workstation/"$1".nix
        install
        sudo nixos-install --flake /mnt/etc/nixos#"$1"
    elif [ "$2" = "update" ]; then
        nix-shell -p git --command "git clone http://192.3.1.1:3000/ExRyuske/dotfiles.git && exit"
        update
        sudo nixos-rebuild switch --recreate-lock-file --flake /etc/nixos#"$1"
    else
        echo "wrong argument"
    fi
else
    echo "wrong argument"
fi