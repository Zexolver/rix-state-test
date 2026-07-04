{
  description = "Rix automated system layout profile configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs"; # <-- ADDED NIXGL INPUT
    swiftfetch.url = "github:Ly-sec/swiftfetch";
    swiftfetch.inputs.nixpkgs.follows = "nixpkgs";
      peeky.url = "github:dmyTRUEk/peeky";
    peeky.inputs.nixpkgs.follows = "nixpkgs";
      xplr.url = "github:sayanarijit/xplr";
    xplr.inputs.nixpkgs.follows = "nixpkgs";
      webx.url = "github:face-hh/webx";
    webx.inputs.nixpkgs.follows = "nixpkgs";
    };

  outputs = { self, nixpkgs, home-manager, nixgl, swiftfetch, peeky, xplr, webx, ... }:
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
            
            home.packages = import ./groups/upstream/default.nix { inherit pkgs webx xplr peeky swiftfetch; };
          }
        ];
      };
    };
}
