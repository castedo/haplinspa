#!/usr/bin/env -S just --justfile

default:
    just --list

latex:
  mkdir -p _preview
  latexmk -pdf -pdflatex="lualatex" \
    -outdir=_preview -auxdir=_build \
    main.tex

baseprint:
  xargs --arg-file baseprinter-xargs.txt baseprinter

baseprint-fast:
  xargs --arg-file baseprinter-xargs.txt baseprinter --skip-pdf

clean:
  rm -rf baseprint
  rm -rf _preview
