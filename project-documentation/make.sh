#!/bin/sh
xelatex -interaction batchmode document
bibtex document
xelatex -interaction batchmode document
xelatex -interaction batchmode document