{
  description = "NixOS ExRyuske";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, disko, home-manager, home-manager-unstable, plasma-manager, ... }@inputs: {
    nixosConfigurations = { 

      # WorkStation
      workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/workstation

          disko.nixosModules.disko
          ./hosts/workstation/disko-config.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.exryuske = import ./hosts/workstation/home.nix;
            };
          }
        ];
      };

      # Server
      server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/server

          disko.nixosModules.disko
          ./hosts/server/disko-config.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.exryuske = import ./hosts/server/home.nix;
            };
          }
        ];
      };

      # SteamDeck
      steamdeck = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/steamdeck

          disko.nixosModules.disko
          ./hosts/steamdeck/disko-config.nix

          home-manager-unstable.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.exryuske = import ./hosts/steamdeck/home.nix;
            };
          }
        ];
      };

      # VM
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vm

          disko.nixosModules.disko
          ./hosts/vm/disko-config.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.exryuske = import ./hosts/vm/home.nix;
            };
          }
        ];
      };
    };
  };
}