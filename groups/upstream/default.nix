{ pkgs, peeky, swiftfetch, ... }:
[
  # Packages managed by Rix
  pkgs.coreutils # Installed via Rix
  pkgs.__ext_flake or (swiftfetch.packages.${pkgs.system}.default) # External flake: github:Ly-sec/swiftfetch
  pkgs.__ext_flake or (peeky.packages.${pkgs.system}.default) # External flake: github:dmyTRUEk/peeky
  pkgs.dorion # Installed via Rix
]
