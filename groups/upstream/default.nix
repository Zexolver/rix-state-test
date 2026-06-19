{ pkgs, webx, xplr, peeky, swiftfetch, ... }:
[
  # Packages managed by Rix
  pkgs.coreutils # Installed via Rix
  pkgs.__ext_flake or (swiftfetch.packages.${pkgs.system}.default) # External flake: github:Ly-sec/swiftfetch
  pkgs.__ext_flake or (peeky.packages.${pkgs.system}.default) # External flake: github:dmyTRUEk/peeky
  pkgs.dorion # Installed via Rix
  pkgs.netscanner # Installed via Rix
  pkgs.__ext_flake or (xplr.packages.${pkgs.system}.default or xplr.defaultPackage.${pkgs.system} or xplr.packages.${pkgs.system}.xplr) # External flake: github:sayanarijit/xplr
  pkgs.bat # Installed via Rix
  pkgs.__ext_flake or (webx.packages.${pkgs.system}.default or webx.defaultPackage.${pkgs.system} or webx.packages.${pkgs.system}.webx) # External flake: github:face-hh/webx
  pkgs.genact # Installed via Rix
]
