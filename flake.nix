{
  description = "Rix automated system layout profile configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL"; # <-- ADDED NIXGL INPUT
    swiftfetch.url = "github:Ly-sec/swiftfetch";
      peeky.url = "github:dmyTRUEk/peeky";
    };

  outputs = { self, nixpkgs, home-manager, nixgl, swiftfetch, peeky, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlay ]; # <-- APPLIED NIXGL OVERLAY
      };
    in {
      homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home.username = "root";
            home.homeDirectory = "/root";
            home.stateVersion = "24.05";
            
            home.packages = import ./groups/upstream/default.nix { inherit pkgs peeky swiftfetch; };
          }
        ];
      };
    };
}