#!/bin/sh
cd "$(dirname "$0")/$1"
rm -f document.aux
pdflatex -halt-on-error document