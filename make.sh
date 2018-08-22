#!/bin/sh
cd "$(dirname "$0")/$1"
./make.sh
mv document.pdf ../$1.pdf