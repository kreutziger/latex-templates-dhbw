#!/bin/sh
pdflatex -interaction nonstopmode document
bibtex document
pdflatex -interaction nonstopmode document
pdflatex -interaction nonstopmode document
pdflatex -interaction nonstopmode document