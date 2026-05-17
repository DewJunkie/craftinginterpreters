# Using the NixOS 25.11 stable release for a consistent Dart 3 environment.
{ pkgs ? import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/nixos-25.11.tar.gz";
  sha256 = "1zn1lsafn62sz6azx6j735fh4vwwghj8cc9x91g5sx2nrg23ap9k";
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
