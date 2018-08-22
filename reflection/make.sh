#!/bin/sh
pdflatex -halt-on-error document
rm document.log
rm document.aux