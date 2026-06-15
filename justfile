baseprint:
  xargs --arg-file baseprinter-xargs.txt baseprinter

baseprint-fast:
  xargs --arg-file baseprinter-xargs.txt baseprinter --skip-pdf

clean:
  rm -rf baseprint
  rm -rf _preview
