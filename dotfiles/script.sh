#!/bin/sh

if [ "$1" = "bender"  ] || [ "$1" = "anton"  ]; then
    if [ "$2" = "install" ]; then
        echo "1"
        nix-shell -p git --command "git clone https://github.com/ExRyuske/dotfiles.git && exit"
        echo "2"
        sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ~/dotfiles/hosts/"$1"/disko.nix
        echo "3"
        sudo nixos-generate-config --no-filesystems --root /mnt
        echo "4"
        sudo rm /mnt/etc/nixos/configuration.nix
        echo "5"
        sudo mv ~/dotfiles/* /mnt/etc/nixos/
        echo "6"
        sudo nixos-install --flake /mnt/etc/nixos#"$1"
    elif [ "$2" = "update" ]; then
        sudo rm -r ~/dotfiles /etc/nixos/*
        git clone https://github.com/ExRyuske/dotfiles.git
        sudo nixos-generate-config --no-filesystems
        sudo rm /etc/nixos/configuration.nix
        sudo mv ~/dotfiles/* /etc/nixos/
        sudo nixos-rebuild switch --flake /etc/nixos#"$1"
    else
        echo "ERROR"
    fi
else
    echo "ERROR"
fi