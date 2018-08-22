#!/bin/sh
pdflatex -halt-on-error document
bibtex document
pdflatex -halt-on-error document
pdflatex -halt-on-error document