#!/bin/sh
pdflatex document
bibtex document
pdflatex document
pdflatex document

rm document.aux
rm document.bbl
rm document.blg
rm document.log