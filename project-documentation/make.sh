#!/bin/sh
xelatex document > /dev/null
bibtex document
xelatex document > /dev/null
texfot xelatex document