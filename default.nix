{
  pkgs ? import <nixpkgs> {},
  stdenv ? pkgs.stdenv,
}:

stdenv.mkDerivation rec {
  name = "hello-go";
  version = "0.0.1";

  src = ./src;

  nativeBuildInputs = with pkgs; [ go ];

  configurePhase = ''
    export GOPATH=$out;
    export GOCACHE=$out/.cache/go-build;
    export GOENV=$out/.config/go/env;
  '';

  buildPhase = ''
    go build main.go
  '';

  installPhase = ''
    go install main.go
  '';
}

