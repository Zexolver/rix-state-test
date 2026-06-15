{
  description = "Rix automated system layout profile configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."root" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home.username = "root";
            home.homeDirectory = "/root";
            home.stateVersion = "24.05";
            
            home.packages = import ./groups/upstream/default.nix { inherit pkgs; };
          }
        ];
      };
    };
}