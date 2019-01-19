#!/bin/sh
texfot xelatex -interaction=nonstopmode document
bibtex document
xelatex -interaction=nonstopmode document > /dev/null
xelatex -interaction=nonstopmode document > /dev/null
texfot xelatex -interaction=nonstopmode document