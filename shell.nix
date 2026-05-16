# Project updated to Dart 3 with Sound Null Safety.
# Using a recent nixpkgs commit for a stable Dart 3 experience.
{ pkgs ? import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/205fd4226592cc83fd4c0885a3e4c9c400efabb5.tar.gz";
  sha256 = "1f5d2g1p6nfwycpmrnnmc2xmcszp804adp16knjvdkj8nz36y1fg";
}) {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.dart
    pkgs.zulu
    pkgs.gcc
    pkgs.gnumake
    pkgs.git
    pkgs.glibcLocales
  ];

  shellHook = ''
    export LANG=en_US.UTF-8
  '';
}
