#!/usr/bin/env -S just --justfile

list:
    just --list

build:
  mkdir -p _preview
  latexmk -pdf -pdflatex="lualatex" \
    -outdir=_preview -auxdir=_build \
    main.tex
  cp preview.html _preview/index.html

contained-build:
  podman run --rm -it -v=$PWD:/mnt -w=/mnt $(cat container-image.txt) just build

clean:
  rm -rf _build
  rm -rf _preview
