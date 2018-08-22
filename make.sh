#!/bin/sh
cd "$(dirname "$0")/$1"
./make.sh
mv document.pdf ../$1.pdf

#cleanup
rm document.aux
rm document.bbl
rm document.blg
rm document.log
rm document.toc