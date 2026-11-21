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
  # .github/workflows/pages-deploy.yaml also has container image reference
  podman run --rm -it -v=$PWD:/mnt -w=/mnt \
    registry.gitlab.com/ellerman/nest/pub/core:2646-be4
    just build

clean:
  rm -rf _build
  rm -rf _preview
