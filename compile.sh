#!/bin/sh
cd "$(dirname "$0")"
rm -f document.aux
cd $1
pdflatex -halt-on-error -output-directory .. document