#!/bin/sh
texfot xelatex document
bibtex document
xelatex document > /dev/null
xelatex document > /dev/null
texfot xelatex document