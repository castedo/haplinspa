#!/usr/bin/env -S just --justfile

build:
  mkdir -p _preview
  latexmk -pdf -pdflatex="lualatex" \
    -outdir=_preview -auxdir=_build \
    main.tex
  cp preview.html _preview/index.html

clean:
  rm -rf _preview
