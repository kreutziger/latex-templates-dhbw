#!/bin/sh
texfot xelatex document
bibtex document
xelatex document > /dev/null
texfot xelatex document